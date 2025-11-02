import 'package:flutter/material.dart';
import 'package:coffee_card/utils/app_colors.dart';

class SubjectCard extends StatelessWidget {
  final String name;
  final String questions;
  final IconData icon;

  const SubjectCard({
    super.key,
    required this.name,
    required this.questions,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 130,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primaryBlue, size: 36),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              questions,
              style: const TextStyle(color: Colors.black54, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
