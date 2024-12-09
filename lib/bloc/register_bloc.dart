import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'services/telegram_service.dart';
import 'package:logging/logging.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final TelegramService _telegramService;
  final Logger _logger = Logger('RegisterBloc');

  RegisterBloc(this._telegramService) : super(Initial()) {
    on<RegisterWithPhoneNumber>(_onRegisterWithPhoneNumber);
  }

  void _onRegisterWithPhoneNumber(
    RegisterWithPhoneNumber event,
    Emitter<RegisterState> emit,
  ) async {
    emit(Loading());
    try {
      if (!_isValidPhoneNumber(event.phoneNumber)) {
        emit(ValidationErrorMessage('Invalid phone number'));
        return;
      }
      _telegramService.sendPhoneNumber(event.phoneNumber);
      String response = _telegramService.receiveResponse();
      if (response.contains('error')) {
        emit(ErrorState('Failed to register'));
      } else if (response.contains('ok')) {
        emit(Registered());
      } else {
        emit(ErrorState('Unexpected response'));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    // Implement a basic phone number validation
    final regex = RegExp(r'^\+?[1-9]\d{1,14}$');
    return regex.hasMatch(phoneNumber);
  }
}
