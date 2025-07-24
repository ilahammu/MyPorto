import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/project/project_bloc.dart';
import '../blocs/theme/theme.dart';
import '../widgets/project_card.dart';
import '../widgets/contact_saya.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Portfolio"),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              themeBloc.add(ToggleTheme());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hi, I'm Ilham Muhijri Yosefin",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Flutter Developer | Mobile & Web Enthusiast",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 32),
              const Text("Projects",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              BlocBuilder<ProjectBloc, ProjectState>(
                builder: (context, state) {
                  if (state is ProjectLoading) {
                    return const Center(child: CircularProgressIndicator());
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
              const SizedBox(height: 32),
              const Text("Contact Me",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              const ContactForm(),
            ],
          ),
        ),
      ),
    );
  }
}
