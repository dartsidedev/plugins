// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settings_panel_android/settings_panel_android.dart';
import 'package:settings_panel_android_example/main.dart';

void main() {
  testWidgets('Renders buttons for each panel', (WidgetTester tester) async {
    await tester.pumpWidget(SettingsPanelExampleApp());
    expect(
      find.byWidgetPredicate((Widget widget) => widget is FlatButton),
      findsNWidgets(SettingsPanelAction.values.length),
    );
  });
}
