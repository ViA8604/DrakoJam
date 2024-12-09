import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(Initial()) {
    on<RegisterWithPhoneNumber>(_onRegisterWithPhoneNumber);
  }

  void _onRegisterWithPhoneNumber(
    RegisterWithPhoneNumber event,
    Emitter<RegisterState> emit,
  ) async {
    //Magia de registro con Telegram
    emit(Registered());
  }
}
