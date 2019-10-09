import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settings_panel_android/settings_panel_android.dart';

void main() {
  group('method call', () {
    const MethodChannel channel = MethodChannel('settings_panel_android');

    test('display returns false', () async {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        if (methodCall.method != 'display') throw 'Unexpected method';
        expect(methodCall.arguments is String, true);
        return false;
      });
      expect(await SettingsPanel.display(SettingsPanelAction.nfc), false);
      channel.setMockMethodCallHandler(null);
    });

    test('display returns true', () async {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        if (methodCall.method != 'display') throw 'Unexpected method';
        expect(methodCall.arguments is String, true);
        return true;
      });
      expect(await SettingsPanel.display(SettingsPanelAction.nfc), true);
      channel.setMockMethodCallHandler(null);
    });
  });

  group('enum to string mapping', () {
    test('internet connectivity', () {
      expect(
        actionToString(SettingsPanelAction.internetConnectivity),
        'android.settings.panel.action.INTERNET_CONNECTIVITY',
      );
    });
    test('nfc', () {
      expect(
        actionToString(SettingsPanelAction.nfc),
        'android.settings.panel.action.NFC',
      );
    });
    test('volume', () {
      expect(
        actionToString(SettingsPanelAction.volume),
        'android.settings.panel.action.VOLUME',
      );
    });
    test('wifi', () {
      expect(
        actionToString(SettingsPanelAction.wifi),
        'android.settings.panel.action.WIFI',
      );
    });
  });
}
