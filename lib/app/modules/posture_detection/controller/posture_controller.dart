import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:math' as math;

class PostureController extends GetxController {
  // Camera & Detection
  var status = "Initializing...".obs;
  var isDetecting = false.obs;
  var isCameraInitialized = false.obs;
  CameraController? cameraController;
  late List<CameraDescription> cameras;
  var currentCameraIndex = 1.obs;

  final PoseDetector _poseDetector = PoseDetector(
    options: PoseDetectorOptions(
      model: PoseDetectionModel.accurate,
      mode: PoseDetectionMode.stream,
    ),
  );

  var detectedPoses = <Pose>[].obs;
  var poseFound = false.obs;
  bool _isProcessing = false;
  int _frameCount = 0;
  Size? cameraInputImageSize;

  // TFLite
  Interpreter? _interpreter;
  List<String> _labels = [];
  final List<List<double>> _landmarkBuffer = [];
  var predictedExercise = "Waiting...".obs;
  var confidence = 0.0.obs;

  // Config
  static const int sequenceLength = 60;
  static const int numLandmarks = 33;
  static const int coordsPerLandmark = 4;
  static const int featureSize = numLandmarks * coordsPerLandmark;

  // Smoothing
  final List<String> _predictionHistory = [];
  final List<double> _confidenceHistory = [];
  static const int smoothingWindow = 5;

  @override
  void onInit() {
    super.onInit();
    _loadModel();
    initializeCamera();
  }

  @override
  void onClose() {
    isDetecting.value = false;
    cameraController?.stopImageStream();
    _poseDetector.close();
    cameraController?.dispose();
    _interpreter?.close();
    super.onClose();
  }

  Future<void> _loadModel() async {
    try {
      const modelPath = 'assets/deep_learning/gym_pose_model.tflite';
      const labelsPath = 'assets/deep_learning/labels.txt';

      // Load TFLite model
      final interpreterOptions = InterpreterOptions()
        ..threads = 4
        ..useNnApiForAndroid = false;

      _interpreter = await Interpreter.fromAsset(
        modelPath,
        options: interpreterOptions,
      );

      // Load labels
      final labelsData = await rootBundle.loadString(labelsPath);
      _labels = labelsData
          .split('\n')
          .where((label) => label.trim().isNotEmpty)
          .toList();

      final inputShape = _interpreter!.getInputTensor(0).shape;
      final outputShape = _interpreter!.getOutputTensor(0).shape;

      print("✅ Loaded model with input: $inputShape and output: $outputShape");
      print("✅ Labels: $_labels");
      if (_labels.length != outputShape[1]) {
        print("⚠️ Labels count does not match model output.");
      }

      status.value = "Ready";
    } catch (e) {
      status.value = "Model load failed: $e";
      print("❌ Error loading model: $e");
    }
  }

  Future<void> initializeCamera({int cameraIndex = 1}) async {
    isCameraInitialized.value = false;
    await cameraController?.dispose();

    cameras = await availableCameras();
    currentCameraIndex.value = cameraIndex < cameras.length ? cameraIndex : 0;
    final selectedCamera = cameras[currentCameraIndex.value];

    cameraController = CameraController(
      selectedCamera,
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: defaultTargetPlatform == TargetPlatform.android
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
    );

    try {
      await cameraController!.initialize();
      isCameraInitialized.value = true;
      if (isDetecting.value) startDetection();
    } catch (e) {
      Get.snackbar("Error", "Camera init failed: $e");
    }
  }

  void switchCamera() {
    if (cameras.length > 1) {
      final newIndex = (currentCameraIndex.value + 1) % 2;
      initializeCamera(cameraIndex: newIndex);
    }
  }

  void startDetection() {
    if (cameraController == null ||
        !isCameraInitialized.value ||
        _interpreter == null) {
      print("⚠️ Cannot start - camera or model not ready");
      return;
    }

    isDetecting.value = true;
    _landmarkBuffer.clear();
    _predictionHistory.clear();
    _confidenceHistory.clear();
    status.value = "Detecting...";
    cameraController!.startImageStream(_processCameraImage);
  }

  void stopDetection() {
    isDetecting.value = false;
    status.value = "Ready";
    predictedExercise.value = "Waiting...";
    confidence.value = 0.0;
    cameraController?.stopImageStream();
  }

  Future<void> _processCameraImage(CameraImage image) async {
    cameraInputImageSize = Size(image.width.toDouble(), image.height.toDouble());

    if (_isProcessing) return;
    _isProcessing = true;
    _frameCount++;

    final inputImage = _inputImageFromCameraImage(image);
    if (inputImage == null) {
      _isProcessing = false;
      return;
    }

    try {
      final poses = await _poseDetector.processImage(inputImage);
      detectedPoses.value = poses;

      if (poses.isNotEmpty) {
        poseFound.value = true;
        final landmarks = _extractAndNormalizeHipCenter(poses.first);
        _landmarkBuffer.add(landmarks);
      } else {
        poseFound.value = false;
        _landmarkBuffer.add(List.filled(featureSize, 0.0));
      }

      if (_landmarkBuffer.length > sequenceLength) {
        _landmarkBuffer.removeAt(0);
      }

      if (_landmarkBuffer.length == sequenceLength && _frameCount % 5 == 0) {
        _runInference();
      }
    } catch (e) {
      print("Error during processing: $e");
    } finally {
      _isProcessing = false;
    }
  }

  void _runInference() {
    if (_interpreter == null) return;

    try {
      final input = List.generate(
        1,
            (_) => List.generate(
          sequenceLength,
              (i) => List<double>.from(_landmarkBuffer[i]),
        ),
      );

      final output = List.filled(1 * _labels.length, 0.0).reshape([1, _labels.length]);
      _interpreter!.run(input, output);

      final scores = List<double>.from(output[0]);
      final maxScore = scores.reduce((a, b) => a > b ? a : b);
      final predictedIndex = scores.indexOf(maxScore);
      final predictedLabel = _labels[predictedIndex];
      final confPercent = maxScore * 100.0;

      print("🧠 Prediction: $predictedLabel ($confPercent%)");

      if (maxScore < 0.40) { // lower threshold!
        predictedExercise.value = "Unknown";
        confidence.value = confPercent;
        return;
      }

      _predictionHistory.add(predictedLabel);
      _confidenceHistory.add(maxScore);

      if (_predictionHistory.length > smoothingWindow) {
        _predictionHistory.removeAt(0);
        _confidenceHistory.removeAt(0);
      }

      final labelCounts = <String, double>{};
      for (int i = 0; i < _predictionHistory.length; i++) {
        final label = _predictionHistory[i];
        labelCounts[label] = (labelCounts[label] ?? 0) + _confidenceHistory[i];
      }

      final smoothedPrediction = labelCounts.entries.reduce((a, b) => a.value > b.value ? a : b).key;
      predictedExercise.value = smoothedPrediction;
      confidence.value = confPercent;
    } catch (e) {
      print("❌ Inference error: $e");
      predictedExercise.value = "Error";
      confidence.value = 0.0;
    }
  }

  List<double> _extractAndNormalizeHipCenter(Pose pose) {
    final landmarksArray = List.generate(33, (_) => [0.0, 0.0, 0.0, 0.0]);
    pose.landmarks.forEach((type, lm) {
      landmarksArray[type.index] = [lm.x, lm.y, lm.z, lm.likelihood];
    });

    final lHip = pose.landmarks[PoseLandmarkType.leftHip];
    final rHip = pose.landmarks[PoseLandmarkType.rightHip];
    final lShoulder = pose.landmarks[PoseLandmarkType.leftShoulder];
    final rShoulder = pose.landmarks[PoseLandmarkType.rightShoulder];
    final lKnee = pose.landmarks[PoseLandmarkType.leftKnee];
    final rKnee = pose.landmarks[PoseLandmarkType.rightKnee];
    final lAnkle = pose.landmarks[PoseLandmarkType.leftAnkle];
    final rAnkle = pose.landmarks[PoseLandmarkType.rightAnkle];

    if (lHip == null || rHip == null || lShoulder == null || rShoulder == null) {
      return List.filled(featureSize, 0.0);
    }

    final hipX = (lHip.x + rHip.x) / 2;
    final hipY = (lHip.y + rHip.y) / 2;
    final hipZ = (lHip.z + rHip.z) / 2;

    final shoulderX = (lShoulder.x + rShoulder.x) / 2;
    final shoulderY = (lShoulder.y + rShoulder.y) / 2;
    final shoulderZ = (lShoulder.z + rShoulder.z) / 2;

    final torsoHeight = math.sqrt(
      math.pow(shoulderX - hipX, 2) +
          math.pow(shoulderY - hipY, 2) +
          math.pow(shoulderZ - hipZ, 2),
    );
    final shoulderWidth = math.sqrt(
      math.pow(lShoulder.x - rShoulder.x, 2) +
          math.pow(lShoulder.y - rShoulder.y, 2) +
          math.pow(lShoulder.z - rShoulder.z, 2),
    );
    final hipWidth = math.sqrt(
      math.pow(lHip.x - rHip.x, 2) +
          math.pow(lHip.y - rHip.y, 2) +
          math.pow(lHip.z - rHip.z, 2),
    );

    double legLength = 0.0;
    if (lKnee != null && rKnee != null && lAnkle != null && rAnkle != null) {
      legLength = (
          _dist(lHip, lKnee) +
              _dist(lKnee, lAnkle) +
              _dist(rHip, rKnee) +
              _dist(rKnee, rAnkle)
      ) / 4;
    }

    double scale = 0.5 * torsoHeight + 0.2 * shoulderWidth + 0.15 * hipWidth + 0.15 * legLength;
    if (scale < 0.01) scale = 1;

    final shoulderAngle = math.atan2(rShoulder.y - lShoulder.y, rShoulder.x - lShoulder.x);
    final cosA = math.cos(-shoulderAngle);
    final sinA = math.sin(-shoulderAngle);

    final normalized = <double>[];

    for (final lm in landmarksArray) {
      final visibility = lm[3];
      if (visibility > 0.3) {
        var x = lm[0] - hipX;
        var y = lm[1] - hipY;
        var z = lm[2] - hipZ;

        final rotX = x * cosA - y * sinA;
        final rotY = x * sinA + y * cosA;

        normalized.addAll([
          rotX / scale,
          rotY / scale,
          z / scale,
          visibility.clamp(0.0, 1.0),
        ]);
      } else {
        normalized.addAll([0.0, 0.0, 0.0, 0.0]);
      }
    }

    return normalized;
  }

  double _dist(PoseLandmark a, PoseLandmark b) {
    return math.sqrt(
      math.pow(a.x - b.x, 2) +
          math.pow(a.y - b.y, 2) +
          math.pow(a.z - b.z, 2),
    );
  }

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    final camera = cameras[currentCameraIndex.value];
    final sensorOrientation = camera.sensorOrientation;

    InputImageRotation rotation;
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation) ?? InputImageRotation.rotation0deg;
    } else {
      var rotationCompensation = 90;
      if (camera.lensDirection == CameraLensDirection.front) {
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        rotationCompensation = (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation) ?? InputImageRotation.rotation90deg;
    }

    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    if (format == null) return null;
    final plane = image.planes.first;

    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: format,
        bytesPerRow: plane.bytesPerRow,
      ),
    );
  }
}