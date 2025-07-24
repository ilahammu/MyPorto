import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/theme/theme.dart';
import 'blocs/navigation/navigation.dart';
import 'blocs/project/project_bloc.dart';
import 'blocs/contact/contact_form_bloc.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => ThemeBloc()),
      BlocProvider(create: (_) => NavigationCubit()),
      BlocProvider(create: (_) => ProjectBloc()..add(LoadProjects())),
      BlocProvider(create: (_) => ContactFormBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeMode>(
      builder: (context, mode) {
        return MaterialApp(
          themeMode: mode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const HomePage(),
        );
      },
    );
  }
}
