import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/project_model.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectInitial()) {
    on<LoadProjects>((event, emit) async {
      emit(ProjectLoading());
      await Future.delayed(const Duration(seconds: 1)); // simulasi load
      emit(ProjectLoaded([
        Project("Flutter App", "Aplikasi mobile Flutter."),
        Project("Web Portfolio", "Website dengan Flutter Web."),
      ]));
    });
  }
}
