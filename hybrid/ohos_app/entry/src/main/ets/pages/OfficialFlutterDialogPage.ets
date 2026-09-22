import { FlutterPage, FlutterView } from '@ohos/flutter_ohos'
import { OfficialFlutterEntry } from '../official/OfficialFlutterEntry'
import Curves from '@ohos.curves'
import { createStringMap } from '../common/ParamsMap'
import { OFFICIAL_DART_ARGS, OFFICIAL_DIALOG_ROUTE } from '../common/Constants'

/**
 * 官方集成的透明 Flutter 页面，参照 flutter_boost example 的 FlutterUIDialog。
 */
@Component
export struct OfficialFlutterDialogPage {
  private flutterEntry: OfficialFlutterEntry | null = null
  private flutterView: FlutterView | null = null
  private enableAnimation: boolean = true
  private dialogTransition: object = TransitionEffect.OPACITY
    .combine(TransitionEffect.move(TransitionEdge.BOTTOM))
    .animation({ curve: Curves.springMotion() })

  /** 透明弹窗需要的路由和入口参数 */
  private static buildDialogParams(): Record<string, Object> {
    const params: Record<string, Object> = createStringMap()
    params['dart_entrypoint_args'] = OFFICIAL_DART_ARGS
    params['route'] = OFFICIAL_DIALOG_ROUTE
    params['background_mode'] = 'transparent'
    return params
  }

  async aboutToAppear(): Promise<void> {
    this.flutterEntry = new OfficialFlutterEntry(getContext(this), OfficialFlutterDialogPage.buildDialogParams())
    await this.flutterEntry.aboutToAppear()
    this.flutterView = this.flutterEntry.getFlutterView()
  }

  aboutToDisappear(): void {
    this.flutterEntry?.aboutToDisappear()
  }

  build() {
    NavDestination() {
      FlutterPage({
        viewId: this.flutterView !== null ? this.flutterView.getId() : '',
        xComponentType: XComponentType.TEXTURE,
        // 保持透明，避免首帧后 XComponent 被切成黑色
        xComponentRenderFit: RenderFit.TOP_LEFT
      })
    }
    .mode(NavDestinationMode.DIALOG)
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
      this.enableAnimation = false
    })
    .transition(this.enableAnimation ? this.dialogTransition : null)
  }
}
