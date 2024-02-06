import 'package:flutter/services.dart';

class PiPService {
  static const MethodChannel _channel = MethodChannel("com.example.app/pip");

  static Future<void> enterPiPMode() async {
    try {
      await _channel.invokeMethod('enterPiPMode');
    } on PlatformException catch (e) {
      print("Failed to enter PiP mode: '${e.message}'.");
    }
  }
}
