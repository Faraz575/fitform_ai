import 'package:fitform_ai/App/modules/%20auth/views/signin_screen.dart';
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
    Get.offAll(
          () => SigninScreen(),
      transition: Transition.rightToLeftWithFade,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}