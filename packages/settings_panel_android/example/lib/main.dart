import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:settings_panel_android/settings_panel_android.dart';

void main() => runApp(SettingsPanelExampleApp());

class SettingsPanelExampleApp extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Settings Panel example app'),
        ),
        body: ListView(
          children: SettingsPanelAction.values.map<Widget>((v) {
            return FlatButton(
              onPressed: () async {
                if (!Platform.isAndroid) {
                  showAndroidOnlyWarning();
                  return;
                }
                final successful = await SettingsPanel.display(v);
                if (!successful) {
                  showUnsuccessfulWarning();
                }
              },
              child: Text('$v'),
            );
          }).toList(),
        ),
      ),
    );
  }

  showUnsuccessfulWarning() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
            'Could not display settings panel. Functionality requires API level 29 (Android 10) or more.'),
      ),
    );
  }

  showAndroidOnlyWarning() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('This plugin only works on Android'),
      ),
    );
  }
}
