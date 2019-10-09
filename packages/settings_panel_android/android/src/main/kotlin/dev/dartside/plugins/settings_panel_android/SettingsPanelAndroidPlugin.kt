package dev.dartside.plugins.settings_panel_android

import android.content.Intent
import android.os.Build
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class SettingsPanelAndroidPlugin(private val registrar: Registrar) : MethodCallHandler {
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "settings_panel_android")
            channel.setMethodCallHandler(SettingsPanelAndroidPlugin(registrar))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "display") return handleDisplay(call, result)
        return result.notImplemented()
    }

    private fun handleDisplay(call: MethodCall, result: Result) {
        // Settings.Panel.ACTION_NFC, ..., are only supported on API level 29+.
        if (Build.VERSION.SDK_INT >= 29) {
            val action = call.arguments as String
            val intent = Intent(action)
            val context = registrar.activity() ?: registrar.context()
            if (registrar.activity() == null) {
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            }
            context.startActivity(intent)
            result.success(true)
        } else {
            result.success(false)
        }
    }
}
