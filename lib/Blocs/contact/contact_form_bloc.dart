import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'contact_form_event.dart';
part 'contact_form_state.dart';

class ContactFormBloc extends Bloc<ContactFormEvent, ContactFormState> {
  ContactFormBloc() : super(ContactFormState.initial()) {
    on<NameChanged>((event, emit) => emit(state.copyWith(name: event.name)));
    on<MessageChanged>(
        (event, emit) => emit(state.copyWith(message: event.message)));
    on<SubmitForm>((event, emit) {
      if (state.name.isEmpty || state.message.isEmpty) {
        emit(state.copyWith(error: "Semua field harus diisi"));
      } else {
        emit(state.copyWith(success: true));
      }
    });
  }
}
