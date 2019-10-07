import 'dart:async';

import 'package:flutter/services.dart';

class SettingsPanelAndroid {
  static const MethodChannel _channel =
      const MethodChannel('settings_panel_android');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
