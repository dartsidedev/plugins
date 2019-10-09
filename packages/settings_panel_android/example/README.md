# settings_panel_android_example

Demonstrates how to use the settings_panel_android plugin.

## Important links

* [**Package info**](https://pub.dev/packages/settings_panel_android)
* [**Source code**](https://github.com/dartsidedev/plugins/tree/master/packages/settings_panel_android)
* [**Example app source code**](https://github.com/dartsidedev/plugins/tree/master/packages/settings_panel_android/example)

## Screenshots and screen recordings

<img src="https://github.com/dartsidedev/plugins/blob/master/assets/settings_panel_android/settings_panel_android_example_app.gif?raw=true" alt="GIF Flutter plugin settings_panel_android - Example app in action" height="600"/>

The panels might look different on different devices.

### Internet connectivity panel

```dart
SettingsPanel.display(SettingsPanelAction.internetConnectivity);
```

<img src="https://github.com/dartsidedev/plugins/blob/master/assets/settings_panel_android/settings_panel_android_screenshot_internetConnectivity.png?raw=true" alt="Flutter plugin settings_panel_android - Example app Internet connectivity panel" height="600"/>

### NFC panel

```dart
SettingsPanel.display(SettingsPanelAction.nfc);
```

<img src="https://github.com/dartsidedev/plugins/blob/master/assets/settings_panel_android/settings_panel_android_screenshot_nfc.png?raw=true" alt="Flutter plugin settings_panel_android - Example app NFC panel" height="600"/>


### Volume panel

```dart
SettingsPanel.display(SettingsPanelAction.volume);
```

<img src="https://github.com/dartsidedev/plugins/blob/master/assets/settings_panel_android/settings_panel_android_screenshot_volume.png?raw=true" alt="Flutter plugin settings_panel_android - Example app Volume panel" height="600"/>

### WiFi panel

```dart
SettingsPanel.display(SettingsPanelAction.wifi);
```

<img src="https://github.com/dartsidedev/plugins/blob/master/assets/settings_panel_android/settings_panel_android_screenshot_wifi.png?raw=true" alt="Flutter plugin settings_panel_android - Example app Wi-Fi panel" height="600"/>
