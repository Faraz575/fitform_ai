import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? trailing;

  const SectionHeader({
    super.key,
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        if (trailing != null && trailing!.isNotEmpty) Text(trailing!, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}