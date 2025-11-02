import 'package:flutter/material.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exams = ["JAMB UTME", "WAEC", "NECO", "Post UTME"];

    return Scaffold(
      appBar: AppBar(title: const Text("Supported Exams")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.school, color: Colors.blue),
              title: Text(exam),
              subtitle: const Text("Exam description here..."),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}
