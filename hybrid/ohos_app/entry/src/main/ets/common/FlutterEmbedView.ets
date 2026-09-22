import { FlutterPage } from '@ohos/flutter_ohos'
import { OfficialFlutterEntry } from '../official/OfficialFlutterEntry'
import { common } from '@kit.AbilityKit'
import { createStringMap } from './ParamsMap'

/**
 * 把 FlutterEntry 嵌进现有 ArkUI 页面，对应 Android FlutterFragment。
 */
@Component
export struct FlutterEmbedView {
  /** FlutterAbilityLaunchConfigs 里的启动参数，例如 cached_engine_id / route */
  @Prop params: Record<string, Object> = createStringMap()
  @State viewId: string = ''
  private flutterEntry: OfficialFlutterEntry | null = null
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext

  async aboutToAppear(): Promise<void> {
    this.flutterEntry = new OfficialFlutterEntry(this.context, this.params)
    await this.flutterEntry.aboutToAppear()
    this.viewId = this.flutterEntry.getFlutterView().getId()
  }

  aboutToDisappear(): void {
    this.flutterEntry?.aboutToDisappear()
    this.flutterEntry = null
  }

  onPageShow(): void {
    this.flutterEntry?.onPageShow()
  }

  onPageHide(): void {
    this.flutterEntry?.onPageHide()
  }

  onBackPress(): boolean {
    this.flutterEntry?.onBackPress()
    return true
  }

  build() {
    FlutterPage({
      viewId: this.viewId,
      // 透明弹窗场景用 TEXTURE + TOP_LEFT，避免露出黑色底
      xComponentType: XComponentType.TEXTURE,
      xComponentRenderFit: RenderFit.TOP_LEFT
    })
  }
}
