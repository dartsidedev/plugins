package dev.dartside.plugins.settings_panel_android.settings_panel_android

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class SettingsPanelAndroidPlugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "settings_panel_android")
      channel.setMethodCallHandler(SettingsPanelAndroidPlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }
}
