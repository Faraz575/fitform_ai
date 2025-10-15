import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  var isDarkMode = true.obs;

  void toggleTheme(bool isDark) {
    isDarkMode.value = isDark;
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}