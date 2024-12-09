part of 'register_bloc.dart';

abstract class RegisterEvent implements Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class RegisterWithPhoneNumber extends RegisterEvent {
  final String phoneNumber;

  const RegisterWithPhoneNumber({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

class ValidationError extends RegisterEvent {
  final String error;

  ValidationError(this.error);
}

class RegisterSuccess extends RegisterEvent {}

class RegisterFailure extends RegisterEvent {
  final String error;

  RegisterFailure(this.error);
}
