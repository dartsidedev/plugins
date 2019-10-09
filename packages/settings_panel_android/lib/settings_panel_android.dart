/// Library for launching settings panel easily on Android 10+ devices.
///
/// A Settings panel is floating UI that contains a fixed subset of settings to address a particular user problem. For example, the Internet Panel surfaces settings related to connecting to the internet.
///
/// Settings panels appear above the calling app to address the problem without the user needing to open Settings and thus leave their current screen.
///
/// This plugin's documentation cites from:
/// * https://developer.android.com/reference/android/provider/Settings.Panel
/// * https://developer.android.com/about/versions/10/features#settings-panels
library settings_panel_android;

import 'dart:async';

import 'package:meta/meta.dart';
import 'package:flutter/services.dart';

/// Kinds of supported settings panels.
enum SettingsPanelAction {
  /// Settings dialog containing settings to  enable internet connection.
  ///
  /// Settings related to internet connectivity, such as Airplane mode, Wi-Fi, and Mobile Data
  internetConnectivity,

  /// Settings dialog containing NFC-related settings.
  nfc,

  /// Settings dialog containing all volume streams.
  volume,

  /// Show a settings dialog containing controls for Wifi.
  ///
  /// This is useful for apps that need a Wi-Fi connection to perform large uploads or downloads.
  wifi,
}

/// Class that enables launching settings panels on Android 10+ devices.
class SettingsPanel {
  static const MethodChannel _channel =
      const MethodChannel('settings_panel_android');

  /// Displays [action] settings panel to the user.
  ///
  /// Returns whether the settings panel was displayed to the user.
  /// Reasons for not displaying the settings panel to the user:
  /// * device is an iOS device. This plugin only supports Android phones
  /// * device's Android API level is older than 29. The underlying Android feature
  /// of this library was added in Android 10 (API level 29), so the plugin
  /// will not be able to display the settings panel unless the phone's
  /// API level is 29 or higher.
  ///
  /// See [SettingsPanelAction] for available panels.
  ///
  /// ```dart
  /// final ok = SettingsPanel.display(SettingsPanelAction.volume);
  /// if (!ok) {
  ///   print('Could not display settings panel.');
  /// }
  /// ```
  static Future<bool> display(SettingsPanelAction action) async {
    return _channel.invokeMethod('display', actionToString(action));
  }
}

@visibleForTesting
String actionToString(SettingsPanelAction action) {
  switch (action) {
    case SettingsPanelAction.internetConnectivity:
      return 'android.settings.panel.action.INTERNET_CONNECTIVITY';
    case SettingsPanelAction.nfc:
      return 'android.settings.panel.action.NFC';
    case SettingsPanelAction.volume:
      return 'android.settings.panel.action.VOLUME';
    case SettingsPanelAction.wifi:
      return 'android.settings.panel.action.WIFI';
  }
}
