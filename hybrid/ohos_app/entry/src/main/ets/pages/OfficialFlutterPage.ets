import { FlutterPage, FlutterView } from '@ohos/flutter_ohos'
import { OfficialFlutterEntry } from '../official/OfficialFlutterEntry'
import { createStringMap } from '../common/ParamsMap'
import { OFFICIAL_DART_ARGS } from '../common/Constants'

/**
 * 官方集成的 Flutter 页面，参照 flutter_boost example 的 FlutterUIPage 写法。
 * 用 FlutterEntry 直接在当前 Ability 的 Navigation 栈中承载 Flutter 页面。
 */
@Component
export struct OfficialFlutterPage {
  private flutterEntry: OfficialFlutterEntry | null = null
  private flutterView: FlutterView | null = null
  private routeStack: NavPathStack | null = null

  /** 官方模式 Dart 入口参数 */
  private static buildDartArgs(): Record<string, Object> {
    const params: Record<string, Object> = createStringMap()
    params['dart_entrypoint_args'] = OFFICIAL_DART_ARGS
    return params
  }

  async aboutToAppear(): Promise<void> {
    this.flutterEntry = new OfficialFlutterEntry(getContext(this), OfficialFlutterPage.buildDartArgs())
    await this.flutterEntry.aboutToAppear()
    this.flutterView = this.flutterEntry.getFlutterView()
  }

  aboutToDisappear(): void {
    this.flutterEntry?.aboutToDisappear()
  }

  build() {
    NavDestination() {
      FlutterPage({
        viewId: this.flutterView !== null ? this.flutterView.getId() : ''
      })
    }
    .hideTitleBar(true)
    .onBackPressed(() => {
      if (this.flutterEntry === null) {
        return false
      }
      this.flutterEntry.onBackPress()
      return true
    })
    .onShown(() => {
      this.flutterEntry?.onPageShow()
    })
    .onHidden(() => {
      this.flutterEntry?.onPageHide()
    })
    .onReady((ctx: NavDestinationContext) => {
      this.routeStack = ctx.pathStack
    })
  }
}
