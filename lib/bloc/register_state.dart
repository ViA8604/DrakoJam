part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class Initial extends RegisterState {}

class Loading extends RegisterState {}

class ValidationErrorMessage extends RegisterState {
  final String error;

  const ValidationErrorMessage(this.error);
}

class Registered extends RegisterState {}

class ErrorState extends RegisterState {
  final String error;

  const ErrorState(this.error);
}
