part of 'sign_up_bloc.dart';

class SignUpEvent {}

class InitialEvent extends SignUpEvent {}

class ChangeEvent extends SignUpEvent {
  final int step;
  final String text;

  ChangeEvent({required this.step, required this.text});
}

class RegisterEvent extends SignUpEvent {

  final bool success;

  RegisterEvent({required this.success});
}