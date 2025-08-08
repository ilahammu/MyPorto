import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/project/project_bloc.dart';
import '../widgets/project_card.dart';
import '../widgets/contact_saya.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  // GlobalKey untuk tiap section
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Portfolio"),
        actions: [
          TextButton(
            onPressed: () => scrollToSection(aboutKey),
            child: const Text("About", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => scrollToSection(skillsKey),
            child: const Text("Skills", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => scrollToSection(projectsKey),
            child:
                const Text("Projects", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => scrollToSection(contactKey),
            child: const Text("Contact", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // About Section
              Container(
                key: aboutKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hi, I'm Ilham Muhijri Yosefin",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Flutter Developer | Mobile & Web Enthusiast",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Skills Section
              Container(
                key: skillsKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Skills",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        Chip(label: Text("Flutter")),
                        Chip(label: Text("Dart")),
                        Chip(label: Text("Firebase")),
                        Chip(label: Text("Node.js")),
                        Chip(label: Text("Git")),
                        Chip(label: Text("Figma")),
                        Chip(label: Text("MySql")),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Projects Section
              Container(
                key: projectsKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Projects",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    BlocBuilder<ProjectBloc, ProjectState>(
                      builder: (context, state) {
                        if (state is ProjectLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is ProjectLoaded) {
                          return Column(
                            children: state.projects
                                .map((project) => ProjectCard(project: project))
                                .toList(),
                          );
                        } else {
                          return const Text("No projects found.");
                        }
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Contact Section
              Container(
                key: contactKey,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Contact Me",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    ContactForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
