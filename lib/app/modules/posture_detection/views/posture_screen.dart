import 'package:camera/camera.dart';
import 'package:fitform_ai/app/modules/posture_detection/views/widgets/back_pose_painter.dart';
import 'package:fitform_ai/app/modules/posture_detection/views/widgets/pose_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/posture_controller.dart';

class PostureScreen extends StatelessWidget {
  const PostureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PostureController controller = Get.put(PostureController());
    const primaryColor = Color(0xFFE8DE00);
    const bgColor = Color(0xFF1A1A2E);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("Live Posture Detection", style: TextStyle(color: primaryColor)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.flip_camera_ios, color: primaryColor),
            onPressed: controller.switchCamera,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Obx(() {
              if (!controller.isCameraInitialized.value || controller.cameraController == null) {
                return Container(
                  height: Get.height * 0.4,
                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
                  child: const Center(child: CircularProgressIndicator()),
                );
              }

              final camera = controller.cameraController!;
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: Get.height * 0.4,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: camera.value.previewSize!.height,
                          height: camera.value.previewSize!.width,
                          child: CameraPreview(camera),
                        ),
                      ),
                      Obx(() => CustomPaint(
                        painter: camera.description.lensDirection == CameraLensDirection.back
                            ? PosePainterBack(
                          poses: controller.detectedPoses.value,
                          imageSize: controller.cameraInputImageSize ?? Size.zero,
                          cameraLensDirection: camera.description.lensDirection,
                        )
                            : PosePainter(
                          poses: controller.detectedPoses.value,
                          imageSize: controller.cameraInputImageSize ?? Size.zero,
                          cameraLensDirection: camera.description.lensDirection,
                        ),
                      )),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Status', style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 5),
                      Obx(() => Text(controller.status.value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
                    ],
                  ),
                  Obx(() => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: controller.isDetecting.value ? primaryColor.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      controller.isDetecting.value ? 'ACTIVE' : 'INACTIVE',
                      style: TextStyle(color: controller.isDetecting.value ? primaryColor : Colors.grey),
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: Obx(() => ElevatedButton.icon(
                onPressed: controller.isDetecting.value ? controller.stopDetection : controller.startDetection,
                icon: Icon(controller.isDetecting.value ? Icons.stop : Icons.play_arrow),
                label: Text(controller.isDetecting.value ? 'Stop Detection' : 'Start Detection'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: controller.isDetecting.value ? Colors.redAccent : primaryColor,
                  foregroundColor: controller.isDetecting.value ? Colors.white : bgColor,
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )),
            ),
            const SizedBox(height: 30),
            // --- NAYA SECTION: Predicted Exercise aur Confidence ---
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Detected Exercise', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 5),
                  Obx(() => Text(
                    controller.predictedExercise.value,
                    style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(height: 10),
                  const Text('Confidence', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 5),
                  Obx(() => Text(
                    "${controller.confidence.value.toStringAsFixed(2)}%",
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Instructions:', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 15),
            _buildInstructionPoint('Position yourself in front of the camera'),
            _buildInstructionPoint('Ensure good lighting'),
            _buildInstructionPoint('Stand in exercise position'),
            _buildInstructionPoint('AI will analyze your form in real-time'),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          const Icon(Icons.circle, color: Color(0xFFE8DE00), size: 8),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}