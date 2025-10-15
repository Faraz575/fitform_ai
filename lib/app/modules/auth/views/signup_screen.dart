import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
          child: Form(
            key: controller.signupFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.02),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8DE00),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(Icons.person_add_alt_1, color: const Color(0xFF1A1A2E), size: Get.width * 0.1),
                ),
                SizedBox(height: Get.height * 0.04),

                Text(
                  'Create Account',
                  style: TextStyle(color: Colors.white, fontSize: Get.width * 0.08, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Start your fitness transformation today',
                  style: TextStyle(color: Colors.grey[400], fontSize: Get.width * 0.04),
                ),
                SizedBox(height: Get.height * 0.04),

                TextFormField(
                  controller: controller.nameController,
                  validator: (v) => v!.isEmpty ? 'Please enter your name' : null,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration('Full Name', Icons.person_outline),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller.emailController,
                  validator: controller.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration('Email', Icons.email_outlined),
                ),
                const SizedBox(height: 20),
                Obx(() => TextFormField(
                  controller: controller.passwordController,
                  validator: controller.validatePassword,
                  obscureText: !controller.isPasswordVisible.value,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration('Password', Icons.lock_outline).copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                )),
                const SizedBox(height: 20),
                Obx(() => TextFormField(
                  controller: controller.confirmPasswordController,
                  validator: controller.validateConfirmPassword,
                  obscureText: !controller.isConfirmPasswordVisible.value,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration('Confirm Password', Icons.lock_outline).copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isConfirmPasswordVisible.value ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: controller.toggleConfirmPasswordVisibility,
                    ),
                  ),
                )),
                const SizedBox(height: 20),

                Obx(() => CheckboxListTile(
                  value: controller.agreedToTerms.value,
                  onChanged: (val) => controller.agreedToTerms.value = val!,
                  title: RichText(
                    text: TextSpan(
                      text: 'I agree to the ',
                      style: TextStyle(color: Colors.grey[400], fontSize: Get.width * 0.035),
                      children: const [
                        TextSpan(text: 'Terms of Service', style: TextStyle(color: Color(0xFFE8DE00))),
                        TextSpan(text: ' and '),
                        TextSpan(text: 'Privacy Policy', style: TextStyle(color: Color(0xFFE8DE00))),
                      ],
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  activeColor: const Color(0xFFE8DE00),
                  checkColor: const Color(0xFF1A1A2E),
                )),
                SizedBox(height: Get.height * 0.03),

                Obx(() => SizedBox(
                  width: double.infinity,
                  height: Get.height * 0.07,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value ? null : controller.signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE8DE00),
                      foregroundColor: const Color(0xFF1A1A2E),
                    ),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(color: Color(0xFF1A1A2E))
                        : Text('Create Account', style: TextStyle(fontSize: Get.width * 0.045, fontWeight: FontWeight.bold)),
                  ),
                )),
                SizedBox(height: Get.height * 0.03),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ", style: TextStyle(color: Colors.grey[400])),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Color(0xFFE8DE00), fontWeight: FontWeight.bold),
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