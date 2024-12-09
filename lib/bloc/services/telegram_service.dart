import '../../tdlib_config.dart';

class TelegramService {
  void init() {
    TdLib.initTdlib();
    print("TdLib initialized");
  }

  void sendPhoneNumber(String phoneNumber) {
    String request =
        '{"@type": "setAuthenticationPhoneNumber", "phone_number": "$phoneNumber"}';
    TdLib.sendRequest(request);
  }

  String receiveResponse() {
    return TdLib.receiveResponse();
  }
}
