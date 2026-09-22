import { FlutterEntry } from '@ohos/flutter_ohos'
import { HostRouter } from '../common/HostRouter'

/**
 * 官方集成模式专用的 FlutterEntry。
 * Flutter 根路由被 pop 后会触发 SystemNavigator.pop()，
 * 默认实现走旧 router.back()，会绕过 Navigation 栈导致退出应用。
 */
export class OfficialFlutterEntry extends FlutterEntry {
  popSystemNavigator(): boolean {
    HostRouter.pop()
    return true
  }
}
