# `dartsidedev/settings_panel_android`

This Flutter plugin helps you show settings panels directly from your Dart code.

This plugin **only works on Android devices with API level 29 or more**, as `Settings.Panel` is an Android 10 feature. On iOS devices and Android devices with older API levels, the plugin simply does not do anything.

![`dartsidedev/settings_panel_android` example app screenshot displaying internet connectivity settings panel](https://github.com/dartsidedev/plugins/blob/master/assets/settings_panel_android/settings_panel_android_screenshot_internetConnectivity.png?raw=true)

## Introduction

### `Settings.Panel`

Using this Flutter plugin, displaying settings panels is now a breeze also from your Dart code.

[Android 10 introduced *Settings Panels*](https://developer.android.com/about/versions/10/features#settings-panels)

> Settings Panels is an API that allows apps to show settings to users in the context of their app. This prevents users from needing to go into "Settings" to change things like "NFC" or "Mobile data" in order to use the app.

With Android 10, your app can display an inline panel showing settings (connectivity, WiFi, NFC, and volume) and the user can change these settings without leaving your app.  *([Android 10 Features](https://developer.android.com/about/versions/10/features#settings-panels))*

A Settings panel is floating UI that contains a fixed subset of settings to address a particular user problem. For example, the Internet Panel surfaces settings related to connecting to the internet.

Settings panels appear above the calling app to address the problem without the user needing to open Settings and thus leave their current screen. *([Android documentation `Settings.Panel`](https://developer.android.com/reference/android/provider/Settings.Panel))*

## Usage

```dart
FlatButton(
  child: Text('Open NFC inline settings panel'),
  onPressed: () {
    final action = SettingsPanelAction.nfc
    final successful = await SettingsPanel.display(action);
    if (!successful) {
      // Maybe iOS or old Android version...
      print('Panel was not shown to the user');
    }
  }
)
```

## Example app

You can see a very simple example app with its source code and screen recordings in the [`example`](https://github.com/dartsidedev/plugins/tree/master/packages/settings_panel_android/example) folder of this plugin.


## Important links

* [**Package info**](https://pub.dev/packages/settings_panel_android)
* [**Source code**](https://github.com/dartsidedev/plugins/tree/master/packages/settings_panel_android)
* [**Issues**](https://github.com/dartsidedev/plugins/issues)
* [**Docs**](https://pub.dev/documentation/settings_panel_android/latest/)
* [**Examples**](https://github.com/dartsidedev/plugins/tree/master/packages/settings_panel_android/example)
* [**CI**](https://travis-ci.com/dartsidedev/plugins)

## FAQ

##### What happens on iOS devices?

The way the plugin is implemented, the iOS platform specific call just returns `false`. It will crash your app, but I recommend you check the platform the app is being executed on and call this plugin's method only if you are on Android


```dart
import 'dart:io' show Platform;

import 'package:settings_panel_android/settings_panel_android.dart';

// ... example
if (Platform.isAndroid) {
  // Let's show for example a volume settings panel
  SettingsPanel.display(SettingsPanelAction.volume);
}
```

##### What happens on Android devices that have API level <29?

The plugin automatically checks the API level on the Android side, so it's safe to use on all versions of Android. On older versions, the Android code simply skips launching the settings panel.

Alternatively, you can also check the Android version from your Dart code, for example, using [`device_info`](https://pub.dev/packages/device_info).

##### Isn't this just an `Intent` call?

Yes, you can open settings panels quite simply *if you are an experienced Android developer.* You can also just launch the intent from your Dart code using [`android_intent`](https://pub.dev/packages/android_intent), if you don't want to depend on this package.

In my opinion, the only thing we should assume about Flutter developers is that they know Dart and they want to create beautiful app and great user experiences.

Having a simple *Dart API* is crucial for great development experience and it can make launching settings panels easier. It provides the right level of abstraction for Dart developers. As a Flutter developer, I don't care about intents, extra flags, and context. All I care about is letting my users switch settings easily by displaying them settings panels. The plugin is well-documented, type safe, tested on different devices and used by many developers (or if it's not used by many yet, then it will be one day). 

While writing the plugin, I committed so many small mistakes, that a simple feature like this took me hours to implement 90% correctly. Publishing a plugin lets other developers completely skip this learning and debugging phase and they can focus on creating great experiences on modern Android devices.

What about the other 10%? Well, I don't know about any issues yet, but if you find something, [create an issue](https://github.com/dartsidedev/plugins/issues).

Do you have an issue with the plugin? [Check if there is already an issue filed for your problem.](https://github.com/dartsidedev/plugins/labels/p%3A%20settings_panel_android)

## About

Created and maintained by *Vince Varga*.
