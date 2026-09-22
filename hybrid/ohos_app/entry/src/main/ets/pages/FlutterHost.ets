import { common } from '@kit.AbilityKit'
import { FlutterPage } from '@ohos/flutter_ohos'

let storage = LocalStorage.getShared()
const EVENT_BACK_PRESS = 'EVENT_BACK_PRESS'

/**
 * FlutterAbility 加载的宿主页，对应模块模板里的 Index。
 */
@Entry(storage)
@Component
struct FlutterHost {
  private context = getContext(this) as common.UIAbilityContext
  @LocalStorageLink('viewId') viewId: string = ''

  build() {
    Column() {
      FlutterPage({ viewId: this.viewId })
    }
    .width('100%')
    .height('100%')
  }

  onBackPress(): boolean {
    this.context.eventHub.emit(EVENT_BACK_PRESS)
    return true
  }
}
