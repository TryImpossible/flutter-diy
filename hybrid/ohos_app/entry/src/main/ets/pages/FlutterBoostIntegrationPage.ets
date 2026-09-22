import { promptAction } from '@kit.ArkUI'
import { FlutterBoost } from 'flutter_boost'
import { BOOST_DIALOG_PAGE, BOOST_MAIN_PAGE } from '../common/Constants'
import { createStringMap } from '../common/ParamsMap'
import { BoostDisplayMode } from '../common/HostRouter'
import { BoostDisplayHub } from '../flutterboost/BoostDelegate'

/**
 * FlutterBoost 演示页，对应 Android FlutterBoostIntegrationActivity。
 */
@Component
export struct FlutterBoostIntegrationPage {
  /** 打开 FlutterBoost 主页面并接收返回数据 */
  private openFlutterPage(): void {
    const args: Record<string, Object> = createStringMap()
    args['data'] = '来自原生的数据'
    FlutterBoost.getInstance().open(BOOST_MAIN_PAGE, args, true, (_pageName: string, result: Record<string, Object>) => {
      promptAction.showToast({ message: JSON.stringify(result) })
    })
  }

  /** 打开透明 Flutter 页面 */
  private openTransparentFlutterPage(): void {
    BoostDisplayHub.displayMode = BoostDisplayMode.TRANSPARENT
    FlutterBoost.getInstance().open(BOOST_DIALOG_PAGE, createStringMap(), false)
  }

  /** 打开透明 Flutter 弹窗，对应 Android DialogFragment */
  private openTransparentFlutterDialog(): void {
    BoostDisplayHub.displayMode = BoostDisplayMode.DIALOG
    const args: Record<string, Object> = createStringMap()
    args['data'] = '来自原生的数据'
    FlutterBoost.getInstance().open(BOOST_DIALOG_PAGE, args, false)
  }

  build() {
    NavDestination() {
      Column({ space: 16 }) {
        Button('跳转Flutter页面')
          .width('80%')
          .onClick(() => this.openFlutterPage())
        Button('跳转透明的Flutter页面')
          .width('80%')
          .onClick(() => this.openTransparentFlutterPage())
        Button('跳转透明的FlutterDialog')
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
