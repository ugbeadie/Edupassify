import 'package:coffee_card/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'exams_screen.dart';

class AllSubjectsScreen extends StatelessWidget {
  const AllSubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subjects = [
      "Mathematics",
      "English Language",
      "Chemistry",
      "Physics",
      "Biology",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Subjects",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryBlue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final subject = subjects[index];
          return Card(
            child: ListTile(
              title: Text(subject),
              subtitle: const Text("245 questions • 12 topics"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ExamsScreen()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
