import 'package:flutter/material.dart';

class QuickStatsCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const QuickStatsCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFE8DE00);

    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          // --- CHANGES ARE HERE ---
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF2E2E48).withOpacity(0.5),
              const Color(0xFF1A1A2E).withOpacity(0.5),
            ],
          ),
          borderRadius: BorderRadius.circular(20), // Thoda zyada rounded
          border: Border.all(color: primaryColor.withOpacity(0.3)), // Border ko subtle kiya
          boxShadow: [
            // Thoda sa glow add kiya
            BoxShadow(
              color: primaryColor.withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            // Icon ko ek circle me daal diya
            CircleAvatar(
              radius: 20,
              backgroundColor: primaryColor.withOpacity(0.1),
              child: Icon(icon, color: primaryColor, size: 22),
            ),
            const SizedBox(height: 15),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24, // Thoda sa bada
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}