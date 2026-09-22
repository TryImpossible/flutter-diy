import { FlutterAbilityLaunchConfigs } from '@ohos/flutter_ohos'
import { FlutterEmbedView } from '../common/FlutterEmbedView'
import { OFFICIAL_ENGINE_ID } from '../common/Constants'
import { createStringMap } from '../common/ParamsMap'

/**
 * 在现有原生页面中嵌入 Flutter，对应 Android ExistingFlutterFragmentActivity。
 */
@Component
export struct ExistingFlutterPage {
  private cachedEngineParams: Record<string, Object> = ExistingFlutterPage.buildCachedEngineParams()

  /** 使用预热引擎 id 组装 FlutterEntry 参数 */
  private static buildCachedEngineParams(): Record<string, Object> {
    const params: Record<string, Object> = createStringMap()
    params[FlutterAbilityLaunchConfigs.EXTRA_CACHED_ENGINE_ID] = OFFICIAL_ENGINE_ID
    return params
  }

  build() {
    NavDestination() {
      Column() {
        FlutterEmbedView({ params: this.cachedEngineParams })
      }
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
  }
}
