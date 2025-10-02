import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fitform_ai/app/modules/onboarding/views/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimationSmart;
  late Animation<Offset> _slideAnimationFitness;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    _slideAnimationSmart =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutQuad),
    );
    _slideAnimationFitness =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutQuad),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    // A small delay can still help, but the main fix is the shadow removal.
    Timer(const Duration(milliseconds: 100), () {
      if (mounted) {
        _animationController.forward();
      }
    });

    _navigateToOnboarding();
  }

  void _navigateToOnboarding() {
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // A short delay before navigating
        Timer(const Duration(milliseconds: 300), () {
          if (mounted) {
            // Use standard Navigator for more reliable performance
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    OnboardingScreen(),
                transitionDuration: const Duration(milliseconds: 800),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  // You can still create a nice transition here
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
              ),
            );
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth =
        MediaQuery.of(context).size.width; // Use MediaQuery instead of Get
    final screenHeight = MediaQuery.of(context).size.height;

    final circleSize = screenWidth * 0.4;
    final iconSize = circleSize * 0.45;
    final smartFontSize = screenWidth * 0.12;
    final fitnessFontSize = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RepaintBoundary(
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFE8DE00),
                    // FIX 1: Remove the heavy, expensive BoxShadow.
                    // A simple, subtle shadow is much more performant.
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
                  child: Icon(
                    Icons.fitness_center,
                    color: const Color(0xFF1A1A2E),
                    size: iconSize,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            RepaintBoundary(
              child: SlideTransition(
                position: _slideAnimationSmart,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    'SMART',
                    style: TextStyle(
                        fontSize: smartFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            RepaintBoundary(
              child: SlideTransition(
                position: _slideAnimationFitness,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    'FITNESS',
                    style: TextStyle(
                        fontSize: fitnessFontSize,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFFE8DE00),
                        letterSpacing: 8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
