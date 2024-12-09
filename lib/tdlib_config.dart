// lib/tdlib_config.dart
import 'dart:ffi';
import 'package:ffi/ffi.dart';

class TdLib {
  static final _tdLib = DynamicLibrary.open('lib/td/build/libtdjson.so');

  static final tdCreateClient =
      _tdLib.lookupFunction<Pointer<Void> Function(), Pointer<Void> Function()>(
          'td_create_client_id');
  static final tdSend = _tdLib.lookupFunction<
      Void Function(Pointer<Void>, Pointer<Utf8>),
      void Function(Pointer<Void>, Pointer<Utf8>)>('td_send');

  static final tdReceive = _tdLib.lookupFunction<Pointer<Utf8> Function(Int64),
      Pointer<Utf8> Function(int)>('td_receive');

  static final tdExecute = _tdLib.lookupFunction<
      Pointer<Utf8> Function(Pointer<Utf8>),
      Pointer<Utf8> Function(Pointer<Utf8>)>('td_execute');

  static Pointer<Void>? client;

  static void initTdlib() {
    client = tdCreateClient();
    sendRequest('{"@type": "setLogVerbosityLevel", "new_verbosity_level": 2}');
  }

  static void sendRequest(String request) {
    final requestPtr = request.toNativeUtf8();
    tdSend(client!, requestPtr);
    malloc.free(requestPtr);
  }

  static String receiveResponse() {
    final responsePtr = tdReceive(1);
    final response = responsePtr.toDartString();
    malloc.free(responsePtr);
    return response;
  }
}
