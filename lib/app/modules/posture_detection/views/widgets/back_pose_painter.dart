import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

class PosePainterBack extends CustomPainter {
  final List<Pose> poses;
  final Size imageSize; // The raw size of the CameraImage from the stream
  final CameraLensDirection cameraLensDirection;

  // --- Enhanced Color Palette ---
  static const Color _leftSideColor = Color(0xFF00BCD4); // Cyan
  static const Color _rightSideColor = Color(0xFFFF9800); // Orange
  static const Color _torsoColor = Color(0xFFE8DE00); // Original Yellow
  static const Color _jointFillColor = Colors.white;

  PosePainterBack({
    required this.poses,
    required this.imageSize,
    required this.cameraLensDirection,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (poses.isEmpty || imageSize.isEmpty) return;

    // --- 1. CALCULATE THE DESTINATION RECT ---
    final canvasSize = size;
    final sourceSize = Size(imageSize.height, imageSize.width); // Swapped for 90-degree rotation
    final fittedSizes = applyBoxFit(BoxFit.cover, sourceSize, canvasSize);
    final Rect destinationRect = Alignment.center.inscribe(fittedSizes.destination, Offset.zero & canvasSize);

    // --- 2. DRAW POSES ---
    for (final pose in poses) {
      final Map<PoseLandmarkType, Offset> landmarkPoints = {};

      for (final landmark in pose.landmarks.values) {
        landmarkPoints[landmark.type] = _transform(landmark, destinationRect, sourceSize);
      }

      // Draw all skeleton connections
      _drawSkeleton(canvas, landmarkPoints);

      // Draw all enhanced joints on top
      _drawJoints(canvas, landmarkPoints);
    }
  }

  void _drawSkeleton(Canvas canvas, Map<PoseLandmarkType, Offset> landmarkPoints) {
    void drawLine(PoseLandmarkType type1, PoseLandmarkType type2) {
      final Offset? point1 = landmarkPoints[type1];
      final Offset? point2 = landmarkPoints[type2];
      if (point1 != null && point2 != null) {
        final Paint paint = _getPaintForLimb(type1, type2);
        canvas.drawLine(point1, point2, paint);
      }
    }

    // Torso
    drawLine(PoseLandmarkType.leftShoulder, PoseLandmarkType.rightShoulder);
    drawLine(PoseLandmarkType.leftHip, PoseLandmarkType.rightHip);
    drawLine(PoseLandmarkType.leftShoulder, PoseLandmarkType.leftHip);
    drawLine(PoseLandmarkType.rightShoulder, PoseLandmarkType.rightHip);

    // Left Arm
    drawLine(PoseLandmarkType.leftShoulder, PoseLandmarkType.leftElbow);
    drawLine(PoseLandmarkType.leftElbow, PoseLandmarkType.leftWrist);

    // Right Arm
    drawLine(PoseLandmarkType.rightShoulder, PoseLandmarkType.rightElbow);
    drawLine(PoseLandmarkType.rightElbow, PoseLandmarkType.rightWrist);

    // Left Leg
    drawLine(PoseLandmarkType.leftHip, PoseLandmarkType.leftKnee);
    drawLine(PoseLandmarkType.leftKnee, PoseLandmarkType.leftAnkle);

    // Right Leg
    drawLine(PoseLandmarkType.rightHip, PoseLandmarkType.rightKnee);
    drawLine(PoseLandmarkType.rightKnee, PoseLandmarkType.rightAnkle);
  }

  void _drawJoints(Canvas canvas, Map<PoseLandmarkType, Offset> landmarkPoints) {
    for (final entry in landmarkPoints.entries) {
      final point = entry.value;
      final type = entry.key;
      final Color limbColor = _getColorForLimb(type);

      // Outer colored ring
      final borderPaint = Paint()
        ..color = limbColor
        ..style = PaintingStyle.fill;
      canvas.drawCircle(point, 8.0, borderPaint);

      // Inner white fill
      final fillPaint = Paint()
        ..color = _jointFillColor
        ..style = PaintingStyle.fill;
      canvas.drawCircle(point, 5.0, fillPaint);
    }
  }

  // --- Helper Methods for Enhanced Styling ---

  Paint _getPaintForLimb(PoseLandmarkType start, PoseLandmarkType end) {
    final paint = Paint()
      ..strokeWidth = 5.0 // Thicker lines
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    paint.color = _getColorForLimb(start);
    return paint;
  }

  Color _getColorForLimb(PoseLandmarkType type) {
    if (type.toString().contains('left')) {
      return _leftSideColor;
    } else if (type.toString().contains('right')) {
      return _rightSideColor;
    } else {
      return _torsoColor;
    }
  }

  // --- REPLACE THIS ENTIRE METHOD WITH THE FIXED VERSION BELOW ---
  Offset _transform(PoseLandmark landmark, Rect destinationRect, Size sourceSize) {
    // The landmark is from the upright input image. The FittedBox shows a rotated view.
    // We need to map the landmark from the input image's coordinate system to the
    // rotated display's coordinate system.
    // A 90-degree counter-clockwise rotation maps (x, y) to (imageHeight - y, x).
    double x = imageSize.height - landmark.y;
    double y = landmark.x;

    // Now, scale the point from the display source space to the final destinationRect.
    final double scaleX = destinationRect.width / sourceSize.width;
    final double scaleY = destinationRect.height / sourceSize.height;

    x = x * scaleX + destinationRect.left;
    y = y * scaleY + destinationRect.top;

    // For the back camera, there is NO mirroring.
    // The front camera preview is mirrored, but the back camera preview is not.
    // So we do nothing here.

    return Offset(x, y);
  }

  @override
  bool shouldRepaint(covariant PosePainterBack oldDelegate) {
    return oldDelegate.poses != poses ||
        oldDelegate.imageSize != imageSize ||
        oldDelegate.cameraLensDirection != cameraLensDirection;
  }
}