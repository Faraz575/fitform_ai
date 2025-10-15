import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../dashboard/views/dashboard_screen.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  var isLoading = false.obs;
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var agreedToTerms = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    if (!GetUtils.isEmail(value)) return 'Please enter a valid email';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) return 'Passwords do not match';
    return null;
  }

  void signIn() async {
    final isValid = signinFormKey.currentState?.validate();
    if (isValid == null || !isValid) return;

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    Get.offAll(
          () => const DashboardScreen(),
      transition: Transition.zoom,
      duration: const Duration(milliseconds: 500),
    );
  }

  void signUp() async {
    final isValid = signupFormKey.currentState?.validate();
    if (isValid == null || !isValid) return;

    if (!agreedToTerms.value) {
      Get.snackbar('Error', 'You must agree to the Terms of Service...');
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    Get.offAll(
          () => const DashboardScreen(),
      transition: Transition.zoom,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}