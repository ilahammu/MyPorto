import 'package:flutter/material.dart';

class SectionAbout extends StatelessWidget {
  const SectionAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("👋 Hello, I'm Ilham",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text("A Flutter Developer from Indonesia."),
        SizedBox(height: 16),
        Text("Skills:"),
        Wrap(
          spacing: 8,
          children: [
            Chip(label: Text("Flutter")),
            Chip(label: Text("Dart")),
            Chip(label: Text("Firebase")),
            Chip(label: Text("Git")),
            Chip(label: Text("Node.js")),
          ],
        )
      ],
    );
  }
}
