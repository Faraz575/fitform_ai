import 'package:fitform_ai/app/modules/dashboard/views/widgets/main_action_card.dart';
import 'package:fitform_ai/app/modules/dashboard/views/widgets/quick_stats_card.dart';
import 'package:fitform_ai/app/modules/dashboard/views/widgets/recent_workout_card.dart';
import 'package:fitform_ai/app/modules/dashboard/views/widgets/section_header.dart';
import 'package:fitform_ai/app/modules/posture_detection/views/posture_screen.dart';
import 'package:fitform_ai/app/modules/settings/views/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../exercise_library/views/library_screen.dart';
import '../controller/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    const primaryColor = Color(0xFFE8DE00);
    const bgColor = Color(0xFF1A1A2E);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(primaryColor),
              const SizedBox(height: 30),

              // Main Action Cards
              MainActionCard(
                icon: Icons.camera_alt,
                title: 'Live Posture Detection',
                subtitle: 'AI-powered form analysis',
                onTap: () => Get.to(() => const PostureScreen(),
                    transition: Transition.rightToLeft),
              ),
              const SizedBox(height: 20),
              MainActionCard(
                icon: Icons.fitness_center,
                title: 'Exercise Library',
                subtitle:
                    '${controller.totalExercises.value}+ professional exercises',
                onTap: () {
                  Get.to(() => const LibraryScreen(),
                      transition: Transition.rightToLeft);
                },
              ),
              const SizedBox(height: 30),

              // Quick Stats
              SectionHeader(
                  title: 'Quick Stats',
                  trailing:
                      'Total: ${controller.totalExercises.value} exercises'),
              const SizedBox(height: 20),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuickStatsCard(
                          icon: Icons.fitness_center,
                          value: controller.totalExercises.value.toString(),
                          label: 'Exercises'),
                      QuickStatsCard(
                          icon: Icons.category,
                          value: controller.totalCategories.value.toString(),
                          label: 'Categories'),
                      QuickStatsCard(
                          icon: Icons.stacked_line_chart,
                          value: controller.totalLevels.value.toString(),
                          label: 'Levels'),
                    ],
                  )),
              const SizedBox(height: 30),

              // Recent Workouts
              const SectionHeader(title: 'Recent Workouts'),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecentWorkoutCard(
                    title: 'Push Day',
                    subtitle: '45 minutes • Yesterday',
                    icon: Icons.upload, // Push ke liye ek suitable icon
                  ),
                  RecentWorkoutCard(
                    title: 'Leg Day',
                    subtitle: '45 minutes • Yesterday',
                    icon: Icons.downloading, // Leg day ke liye ek suitable icon
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Color primaryColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Smart Fitness',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: Get.width * 0.08,
                    fontWeight: FontWeight.bold)),
            const Text('AI-Powered Workout Assistant',
                style: TextStyle(color: Colors.white70)),
          ],
        ),
        Row(
          children: [
            _buildIconButton(Icons.search, () {}),
            const SizedBox(width: 10),
            _buildIconButton(
                Icons.settings,
                () => Get.to(() => const SettingsScreen(),
                    transition: Transition.rightToLeft)),
          ],
        ),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Color(0xFFE8DE00)),
      ),
    );
  }
}
