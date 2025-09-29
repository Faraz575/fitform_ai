import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPageContent extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
                spreadRadius: 30.0,
              ),
              BoxShadow(
                color: const Color(0xFF2E2E48).withOpacity(0.3),
                blurRadius: 40.0,
                spreadRadius: 20.0,
              ),
            ],
          ),
          child: Icon(icon, color: const Color(0xFF1A1A2E), size: 70),
        ),
        const SizedBox(height: 60),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFFE8DE00),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}