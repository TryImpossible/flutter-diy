import Curves from '@ohos.curves'
import hilog from '@ohos.hilog'
import { FlutterBoostEntry } from 'flutter_boost'
import { FlutterPage, FlutterView } from '@ohos/flutter_ohos'
import { RouterOptions } from '../common/HostRouter'

const TAG: string = 'FlutterBoostHost'

/**
 * FlutterBoost 全屏容器页，结构对齐官方 example 的 FlutterUIPage。
 */
@Component
export struct FlutterBoostHost {
  private flutterEntry: FlutterBoostEntry | null = null
  private flutterView: FlutterView | null = null
  private routeStack: NavPathStack | null = null
  @Prop xComponentType: XComponentType = XComponentType.SURFACE
  @Prop routerOptions: RouterOptions
  private pushTransition: object = TransitionEffect.OPACITY
    .combine(TransitionEffect.move(TransitionEdge.END))
    .animation({ curve: Curves.springMotion() })

  /** Flutter 页关闭时，把结果回传给 Navigation 栈 */
  private onPopCallback = (result: Record<string, Object>): void => {
    this.routeStack?.pop(result)
  }

  async aboutToAppear(): Promise<void> {
    hilog.info(0x0000, TAG, 'aboutToAppear===')
    this.flutterEntry = new FlutterBoostEntry(getContext(this), this.routerOptions, false, this.onPopCallback)
    // 必须等待 FlutterView 创建完成；否则 viewId 为空，页面就是白屏
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
        xComponentType: this.xComponentType
      })
    }
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
    })
    .onReady((ctx: NavDestinationContext) => {
      this.routeStack = ctx.pathStack
      this.flutterEntry?.onReady(ctx.pathStack)
    })
    .transition(this.pushTransition)
  }
}
