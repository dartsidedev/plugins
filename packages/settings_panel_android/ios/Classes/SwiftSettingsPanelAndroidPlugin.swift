import Flutter
import UIKit

public class SwiftSettingsPanelAndroidPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "settings_panel_android", binaryMessenger: registrar.messenger())
    let instance = SwiftSettingsPanelAndroidPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
