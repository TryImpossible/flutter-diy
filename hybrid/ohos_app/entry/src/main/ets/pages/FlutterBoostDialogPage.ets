import Curves from '@ohos.curves'
import hilog from '@ohos.hilog'
import { FlutterBoostEntry } from 'flutter_boost'
import { FlutterPage, FlutterView } from '@ohos/flutter_ohos'
import { RouterOptions } from '../common/HostRouter'

const TAG: string = 'FlutterBoostDialogPage'

/**
 * FlutterBoost 透明弹窗页，结构对齐官方 example 的 FlutterUIDialog。
 */
@Component
export struct FlutterBoostDialogPage {
  private flutterEntry: FlutterBoostEntry | null = null
  private flutterView: FlutterView | null = null
  @Prop xComponentType: XComponentType = XComponentType.TEXTURE
  @Prop routerOptions: RouterOptions
  @State enableAnimation: boolean = true
  private dialogTransition: object = TransitionEffect.OPACITY
    .combine(TransitionEffect.move(TransitionEdge.BOTTOM))
    .animation({ curve: Curves.springMotion() })

  async aboutToAppear(): Promise<void> {
    hilog.info(0x0000, TAG, 'aboutToAppear===')
    this.flutterEntry = new FlutterBoostEntry(getContext(this), this.routerOptions, true)
    await this.flutterEntry.aboutToAppear()
    this.flutterView = this.flutterEntry.getFlutterView()
  }

  aboutToDisappear(): void {
    hilog.info(0x0000, TAG, 'aboutToDisappear===')
    this.flutterEntry?.aboutToDisappear()
  }

  build() {
    NavDestination() {
      FlutterPage({
        viewId: this.flutterView !== null ? this.flutterView.getId() : '',
        xComponentType: this.xComponentType,
        // RESIZE_FILL 首帧后会把 XComponent 背景切成黑色；TOP_LEFT 保持透明，
        // 同时保留内容尺寸，透明弹窗才能露出下层页面
        xComponentRenderFit: RenderFit.TOP_LEFT
      })
    }
    .mode(NavDestinationMode.DIALOG)
    .hideTitleBar(true)
    .onBackPressed(() => {
      if (this.flutterEntry === null) {
        return false
      }
      return this.flutterEntry.onBackPressed()
    })
    .onShown(() => {
      this.flutterEntry?.onShown()
    })
    .onHidden(() => {
      this.flutterEntry?.onHidden()
      this.enableAnimation = false
    })
    .onReady((ctx: NavDestinationContext) => {
      this.flutterEntry?.onReady(ctx.pathStack)
    })
    .transition(this.enableAnimation ? this.dialogTransition : null)
  }
}
