import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<String> {
  NavigationCubit() : super("home");

  void navigateTo(String section) => emit(section);
}
