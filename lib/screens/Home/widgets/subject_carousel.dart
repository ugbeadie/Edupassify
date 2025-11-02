import 'package:flutter/material.dart';
import 'subject_card.dart';
import '../exams_screen.dart';

class SubjectCarousel extends StatelessWidget {
  const SubjectCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> subjects = [
      {
        "name": "Mathematics",
        "questions": "45 questions",
        "icon": Icons.square_foot,
      },
      {"name": "Chemistry", "questions": "38 questions", "icon": Icons.science},
      {"name": "Physics", "questions": "50 questions", "icon": Icons.bolt},
    ];

    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final subject = subjects[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ExamsScreen()),
              );
            },
            child: SubjectCard(
              name: subject["name"] as String,
              questions: subject["questions"] as String,
              icon: subject["icon"] as IconData,
            ),
          );
        },
      ),
    );
  }
}
