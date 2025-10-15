import 'package:camera/camera.dart';
import 'package:fitform_ai/app/data/local/models/exercise_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';

class PostureController extends GetxController {
  var status = "Ready to analyze".obs;
  var isDetecting = false.obs;
  var isCameraInitialized = false.obs;

  // late Exercise selectedExercise;

  CameraController? cameraController;
  late List<CameraDescription> cameras;
  var currentCameraIndex = 1.obs;

  final PoseDetector _poseDetector = PoseDetector(options: PoseDetectorOptions());
  var detectedPoses = <Pose>[].obs;
  Size? cameraImageSize; // This is the preview size
  Size? cameraInputImageSize; // ADDED: This is the raw CameraImage size
  bool _isProcessing = false;

  @override
  void onInit() {
    super.onInit();
    initializeCamera();
  }

  @override
  void onClose() {
    isDetecting.value = false;
    cameraController?.stopImageStream();
    _poseDetector.close();
    cameraController?.dispose();
    super.onClose();
  }

  Future<void> initializeCamera({int cameraIndex = 1}) async {
    isCameraInitialized.value = false;
    await cameraController?.dispose();

    cameras = await availableCameras();
    if (cameras.isEmpty) {
      Get.snackbar("Error", "No cameras found.");
      return;
    }

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
      cameraImageSize = cameraController!.value.previewSize;
      isCameraInitialized.value = true;
      if (isDetecting.value) {
        startDetection();
      }
    } catch (e) {
      Get.snackbar("Error", "Could not initialize camera: $e");
    }
  }

  void switchCamera() {
    if (cameras.length > 1) {
      final newIndex = (currentCameraIndex.value + 1) % 2;
      initializeCamera(cameraIndex: newIndex);
    }
  }

  void startDetection() {
    if (cameraController == null || !isCameraInitialized.value) return;

    isDetecting.value = true;
    status.value = "Detecting Posture...";
    cameraController!.startImageStream((CameraImage image) {
      if (_isProcessing) return;
      _isProcessing = true;
      _processCameraImage(image).then((_) {
        _isProcessing = false;
      });
    });
  }

  void stopDetection() {
    isDetecting.value = false;
    status.value = "Ready to analyze";
    cameraController?.stopImageStream();
  }

  Future<void> _processCameraImage(CameraImage image) async {
    // ADDED: Store the actual input image size from the stream
    cameraInputImageSize = Size(image.width.toDouble(), image.height.toDouble());

    final inputImage = _inputImageFromCameraImage(image);
    if (inputImage == null) return;

    try {
      final poses = await _poseDetector.processImage(inputImage);
      detectedPoses.value = poses;
    } catch (e) {
      print("Error processing image: $e");
    }
  }

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    final camera = cameras[currentCameraIndex.value];
    final sensorOrientation = camera.sensorOrientation;

    InputImageRotation rotation;
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation) ?? InputImageRotation.rotation0deg;
    } else { // Android
      var rotationCompensation = 90;
      if (camera.lensDirection == CameraLensDirection.front) {
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else { // back camera
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