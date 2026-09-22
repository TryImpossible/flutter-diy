import { FlutterAbility, FlutterEngine } from '@ohos/flutter_ohos'
import { GeneratedPluginRegistrant } from '@ohos/flutter_module'
import window from '@ohos.window'

/**
 * 官方集成的透明 Flutter 容器，对应 Android TransparentFlutterActivity。
 */
export default class TransparentFlutterAbility extends FlutterAbility {
  pagePath(): string {
    return 'pages/FlutterHost'
  }

  configureFlutterEngine(flutterEngine: FlutterEngine): void {
    super.configureFlutterEngine(flutterEngine)
    GeneratedPluginRegistrant.registerWith(flutterEngine)
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    super.onWindowStageCreate(windowStage)
    try {
      windowStage.getMainWindowSync().setWindowBackgroundColor('#00000000')
    } catch (err) {
      console.error(`set transparent window failed: ${JSON.stringify(err)}`)
    }
  }
}
