part of 'contact_form_bloc.dart';

abstract class ContactFormEvent {}

class NameChanged extends ContactFormEvent {
  final String name;
  NameChanged(this.name);
}

class MessageChanged extends ContactFormEvent {
  final String message;
  MessageChanged(this.message);
}

class SubmitForm extends ContactFormEvent {}
