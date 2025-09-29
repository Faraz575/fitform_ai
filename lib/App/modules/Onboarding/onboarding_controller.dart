import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;
  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void getStarted() {
    // HomeScreen par jao aur pichli saari screens (splash, onboarding) ko memory se hata do
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}