#import "SettingsPanelAndroidPlugin.h"
#import <settings_panel_android/settings_panel_android-Swift.h>

@implementation SettingsPanelAndroidPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSettingsPanelAndroidPlugin registerWithRegistrar:registrar];
}
@end
