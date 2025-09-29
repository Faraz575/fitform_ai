import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Yahan par hum baad me apne animation controllers ko initialize karenge.
    // For example: _animationController = AnimationController(...);
  }

  @override
  void dispose() {
    // Yahan par hum apne animation controllers ko dispose karenge taaki memory leak na ho.
    // For example: _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // UI bilkul waisa hi hai, lekin ab yeh ek StatefulWidget ke andar hai.
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
                color: const Color(0xFFE8DE00),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE8DE00).withOpacity(0.6),
                    blurRadius: 50.0,
                    spreadRadius: 20.0,
                  ),
                  BoxShadow(
                    color: const Color(0xFF2E2E48).withOpacity(0.3),
                    blurRadius: 10.0,
                    spreadRadius: 15.0,
                  ),
                ],
              ),
              child: const Icon(
                Icons.fitness_center,
                color: Color(0xFF1A1A2E),
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