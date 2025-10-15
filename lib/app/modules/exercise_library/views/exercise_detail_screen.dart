import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/detail_controller.dart';

class ExerciseDetailScreen extends StatelessWidget {
  const ExerciseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailController controller = Get.put(DetailController());

    const primaryColor = Color(0xFFE8DE00);
    const bgColor = Color(0xFF1A1A2E);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(controller.exercise?.title ?? 'Loading...', style: const TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Get.back(),
        ),
      ),
      body: GetBuilder<DetailController>(
        builder: (ctrl) {
          if (ctrl.exercise == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    ctrl.exercise!.gifPath,
                    height: Get.height * 0.35,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => _buildErrorPlaceholder(),
                  ),
                ),
                const SizedBox(height: 30),

                Obx(() {
                  if (ctrl.workoutState.value == WorkoutState.countdown) {
                    return _buildCountdownDisplay(ctrl.countdown.value);
                  }
                  return _buildTimerDisplay(ctrl.currentDuration.value);
                }),
                const Spacer(),

                _buildActionButtons(ctrl),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildErrorPlaceholder() {
    return Container(
      height: Get.height * 0.35,
      color: Colors.black26,
      child: const Center(child: Icon(Icons.error, color: Colors.red, size: 50)),
    );
  }

  Widget _buildCountdownDisplay(int count) {
    return Center(
      child: Text(
        count.toString(),
        style: TextStyle(color: const Color(0xFFE8DE00), fontSize: Get.width * 0.2, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTimerDisplay(int duration) {
    return Column(
      children: [
        Center(
          child: Text(
            '00:${duration.toString().padLeft(2, '0')}',
            style: TextStyle(color: const Color(0xFFE8DE00), fontSize: Get.width * 0.15, fontWeight: FontWeight.bold),
          ),
        ),
        const Center(child: Text('TIME REMAINING', style: TextStyle(color: Colors.grey, letterSpacing: 2))),
      ],
    );
  }

  Widget _buildActionButtons(DetailController controller) {
    return Obx(() {
      switch (controller.workoutState.value) {
        case WorkoutState.active:
          return _buildButton('PAUSE', controller.pauseWorkout, isPrimary: true);
        case WorkoutState.paused:
          return Row(
            children: [
              Expanded(child: _buildButton('RESET', controller.resetWorkout, isPrimary: false)),
              const SizedBox(width: 15),
              Expanded(child: _buildButton('RESUME', controller.resumeWorkout, isPrimary: true)),
            ],
          );
        case WorkoutState.finished:
          return _buildButton('WORKOUT AGAIN', controller.resetWorkout, isPrimary: true);
        case WorkoutState.initial:
        case WorkoutState.countdown:
        default:
          return _buildButton('START', controller.startCountdown, isPrimary: true);
      }
    });
  }

  Widget _buildButton(String text, VoidCallback onPressed, {required bool isPrimary}) {
    const primaryColor = Color(0xFFE8DE00);
    const darkColor = Color(0xFF1A1A2E);

    final buttonStyle = isPrimary
        ? ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: darkColor,
    )
        : OutlinedButton.styleFrom(
      backgroundColor: Colors.white.withOpacity(0.1),
      foregroundColor: primaryColor,
      side: const BorderSide(color: primaryColor, width: 2),
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle.copyWith(
        padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 15)),
        textStyle: MaterialStatePropertyAll(TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold)),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      ),
      child: Text(text),
    );
  }
}