import { TransparentFlutterDialog } from '../official/TransparentFlutterDialog'
import { HostRouter, HostRouteNames } from '../common/HostRouter'

/**
 * 官方 Add-to-App 演示页，对应 Android OfficialIntegrationActivity。
 */
@Component
export struct OfficialIntegrationPage {
  private dialogController: CustomDialogController = new CustomDialogController({
    builder: TransparentFlutterDialog(),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    customStyle: true,
    backgroundColor: Color.Transparent
  })

  /** 用官方模式打开 Flutter 页面 */
  private openCachedFlutterAbility(): void {
    HostRouter.push(HostRouteNames.OFFICIAL_FLUTTER)
  }

  /** 把 Flutter 当成页面嵌进当前 Ability，对应 FlutterFragment */
  private openFlutterFragmentPage(): void {
    HostRouter.push(HostRouteNames.EXISTING_FLUTTER)
  }

  /** 透明背景打开 dialog 路由 */
  private openTransparentFlutterAbility(): void {
    HostRouter.push(HostRouteNames.OFFICIAL_FLUTTER_DIALOG)
  }

  /** 透明 Dialog 里嵌 Flutter，对应 Android DialogFragment */
  private openTransparentFlutterDialog(): void {
    this.dialogController.open()
  }

  build() {
    NavDestination() {
      Column({ space: 16 }) {
        Button('跳转FlutterAbility')
          .width('80%')
          .onClick(() => this.openCachedFlutterAbility())
        Button('跳转FlutterFragment')
          .width('80%')
          .onClick(() => this.openFlutterFragmentPage())
        Button('跳转透明的FlutterAbility')
          .width('80%')
          .onClick(() => this.openTransparentFlutterAbility())
        Button('跳转透明的Flutter弹窗')
          .width('80%')
          .onClick(() => this.openTransparentFlutterDialog())
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .backgroundColor('#F9F6F7')
    }
    .hideTitleBar(true)
  }
}
