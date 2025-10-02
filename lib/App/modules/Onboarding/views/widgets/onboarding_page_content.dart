import 'package:flutter/material.dart';
import 'package:get/get.dart';
class OnboardingPageContent extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const OnboardingPageContent({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  State<OnboardingPageContent> createState() => _OnboardingPageContentState();
}

class _OnboardingPageContentState extends State<OnboardingPageContent> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Ek pulse 2 second tak chalega
    );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    final screenHeight = Get.height;

    final circleSize = screenWidth * 0.4;
    final titleFontSize = screenWidth * 0.07;
    final subtitleFontSize = screenWidth * 0.04;
    final iconSize = circleSize * 0.45;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: circleSize,
            height: circleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE8DE00),
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
            child: Icon(widget.icon, color: const Color(0xFF1A1A2E), size: iconSize),
          ),
        ),
        SizedBox(height: screenHeight * 0.08),

        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFFE8DE00),
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Text(
            widget.subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: subtitleFontSize,
            ),
          ),
        ),
      ],
    );
  }
}