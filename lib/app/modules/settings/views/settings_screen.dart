import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.put(SettingsController());
    const primaryColor = Color(0xFFE8DE00);
    const bgColor = Color(0xFF1A1A2E);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: primaryColor)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Theme Section
            _buildSettingsGroup(
              icon: Icons.palette,
              title: 'Theme',
              child: Obx(() => Column(
                children: [
                  _buildThemeOption(
                    icon: Icons.dark_mode,
                    label: 'Dark Theme',
                    isSelected: controller.isDarkMode.value,
                    onTap: () => controller.toggleTheme(true),
                  ),
                  const SizedBox(height: 10),
                  _buildThemeOption(
                    icon: Icons.light_mode,
                    label: 'Light Theme',
                    isSelected: !controller.isDarkMode.value,
                    onTap: () => controller.toggleTheme(false),
                  ),
                ],
              )),
            ),
            const SizedBox(height: 20),

            // Other Options
            _buildSettingsItem(icon: Icons.notifications, title: 'Notifications', onTap: () {}),
            const SizedBox(height: 20),
            _buildSettingsItem(icon: Icons.lock, title: 'Privacy', onTap: () {}),
            const SizedBox(height: 20),
            _buildSettingsItem(icon: Icons.info, title: 'About', onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsGroup({required IconData icon, required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFFE8DE00), size: 30),
              const SizedBox(width: 15),
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _buildThemeOption({required IconData icon, required String label, required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8DE00) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: isSelected ? null : Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? const Color(0xFF1A1A2E) : Colors.white),
            const SizedBox(width: 15),
            Text(label, style: TextStyle(color: isSelected ? const Color(0xFF1A1A2E) : Colors.white, fontWeight: FontWeight.bold)),
            const Spacer(),
            if (isSelected) Icon(Icons.check_circle, color: const Color(0xFF1A1A2E)),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({required IconData icon, required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFE8DE00), size: 30),
            const SizedBox(width: 15),
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.white54),
          ],
        ),
      ),
    );
  }
}