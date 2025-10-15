import 'package:flutter/material.dart';

class RecentWorkoutCard extends StatelessWidget {
  final String title;
  final String subtitle;
  // Step 1: Humne ek naya parameter 'icon' add kiya hai taaki har card ka icon alag ho sake.
  final IconData icon;

  const RecentWorkoutCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon, // Step 2: Constructor me bhi isko required kar diya hai.
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFE8DE00); // App ki primary color theme

    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          // Step 3: Simple color ke bajaye ek subtle gradient add kiya hai for depth.
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF2E2E48).withOpacity(0.5),
              const Color(0xFF1A1A2E).withOpacity(0.5),
            ],
          ),
          borderRadius: BorderRadius.circular(20), // Thoda zyada rounded for modern look.
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Step 4: Title ke saath icon ko ek Row me daal diya hai.
            Row(
              children: [
                Icon(icon, color: primaryColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 15),

            // Step 5: Ek visual element (progress bar) add kiya hai taaki card "zinda" lage.
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: (title == 'Push Day') ? 0.75 : 0.6, // Example: Dono cards ke liye alag progress
                backgroundColor: Colors.white12,
                valueColor: const AlwaysStoppedAnimation<Color>(primaryColor),
                minHeight: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}