import 'package:flutter/material.dart';

class MainActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const MainActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFE8DE00);
    const darkColor = Color(0xFF1A1A2E);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: primaryColor.withOpacity(0.3), blurRadius: 20, spreadRadius: 2)],
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: darkColor),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: darkColor, fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(subtitle, style: const TextStyle(color: darkColor)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: darkColor),
          ],
        ),
      ),
    );
  }
}