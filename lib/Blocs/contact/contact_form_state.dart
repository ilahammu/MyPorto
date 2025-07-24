part of 'contact_form_bloc.dart';

class ContactFormState extends Equatable {
  final String name;
  final String message;
  final bool success;
  final String error;

  ContactFormState({
    required this.name,
    required this.message,
    required this.success,
    required this.error,
  });

  factory ContactFormState.initial() => ContactFormState(
        name: '',
        message: '',
        success: false,
        error: '',
      );

  ContactFormState copyWith({
    String? name,
    String? message,
    bool? success,
    String? error,
  }) {
    return ContactFormState(
      name: name ?? this.name,
      message: message ?? this.message,
      success: success ?? this.success,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [name, message, success, error];
}
