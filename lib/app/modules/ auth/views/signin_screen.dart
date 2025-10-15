import 'package:fitform_ai/App/modules/%20auth/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
          child: Form(
            key: controller.signinFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.1),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8DE00),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.fitness_center,
                    color: const Color(0xFF1A1A2E),
                    size: Get.width * 0.1,
                  ),
                ),
                SizedBox(height: Get.height * 0.04),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.width * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign in to continue your fitness journey',
                  style: TextStyle(
                      color: Colors.grey[400], fontSize: Get.width * 0.04),
                ),
                SizedBox(height: Get.height * 0.06),
                TextFormField(
                  controller: controller.emailController,
                  validator: controller.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration('Email', Icons.email_outlined),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => TextFormField(
                    controller: controller.passwordController,
                    validator: controller.validatePassword,
                    obscureText: !controller.isPasswordVisible.value,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration('Password', Icons.lock_outline)
                        .copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.05),
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    height: Get.height * 0.07,
                    child: ElevatedButton(
                      onPressed:
                          controller.isLoading.value ? null : controller.signIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE8DE00),
                        foregroundColor: const Color(0xFF1A1A2E),
                      ),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Color(0xFF1A1A2E))
                          : Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: Get.width * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => SignupScreen(),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFFE8DE00),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey[400]),
      prefixIcon: Icon(icon, color: Colors.grey),
      filled: true,
      fillColor: const Color(0xFF2E2E48).withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }
}
