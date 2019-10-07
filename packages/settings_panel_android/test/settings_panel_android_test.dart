import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settings_panel_android/settings_panel_android.dart';

void main() {
  const MethodChannel channel = MethodChannel('settings_panel_android');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await SettingsPanelAndroid.platformVersion, '42');
  });
}
