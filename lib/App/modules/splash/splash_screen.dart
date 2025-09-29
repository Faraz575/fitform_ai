import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitform_ai/app/modules/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() {
    Timer(const Duration(seconds: 2), () {
      Get.off(() => OnboardingScreen());
    });
  }


  @override
  void dispose() {
    // Is screen me abhi koi controller nahi hai, isliye dispose khali hai
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E), // Dark Navy Blue background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Glowing Circle with Icon
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFE8DE00), // Bright Yellow
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE8DE00).withOpacity(0.6),
                    blurRadius: 50.0,
                    spreadRadius: 30.0,
                  ),
                  BoxShadow(
                    color: const Color(0xFF2E2E48).withOpacity(0.3),
                    blurRadius: 40.0,
                    spreadRadius: 20.0,
                  ),
                ],
              ),
              child: const Icon(
                Icons.fitness_center, // Dumbbell Icon
                color: Color(0xFF1A1A2E), // Background wala color
                size: 70,
              ),
            ),
            const SizedBox(height: 40),

            // "SMART" Text
            const Text(
              'SMART',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 8),

            // "FITNESS" Text
            const Text(
              'FITNESS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Color(0xFFE8DE00), // Yellow Color
                letterSpacing: 8.0, // Text ke beech me space
              ),
            ),
          ],
        ),
      ),
    );
  }
}