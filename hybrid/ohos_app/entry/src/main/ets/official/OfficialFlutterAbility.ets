import { FlutterAbility, FlutterEngine } from '@ohos/flutter_ohos'
import { GeneratedPluginRegistrant } from '@ohos/flutter_module'

/**
 * 官方集成的全屏 Flutter 容器，对应 Android FlutterActivity。
 * 通过 Want 传入 cached_engine_id 时复用预热引擎。
 */
export default class OfficialFlutterAbility extends FlutterAbility {
  pagePath(): string {
    return 'pages/FlutterHost'
  }

  configureFlutterEngine(flutterEngine: FlutterEngine): void {
    super.configureFlutterEngine(flutterEngine)
    GeneratedPluginRegistrant.registerWith(flutterEngine)
  }
}
