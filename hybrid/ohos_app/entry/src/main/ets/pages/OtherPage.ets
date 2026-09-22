import { BoostResultHub } from '../flutterboost/BoostDelegate'
import { HostRouter } from '../common/HostRouter'
import { createStringMap } from '../common/ParamsMap'

/**
 * 被 FlutterBoost 打开的原生页，对应 Android OtherActivity / iOS OtherViewController。
 */
@Component
export struct OtherPage {
  @Prop routeParam: Object = createStringMap()
  @State data: string = ''

  aboutToAppear(): void {
    const params = this.routeParam as Record<string, Object>
    const value: Object = params['data']
    this.data = value !== undefined ? (value as string) : ''
  }

  aboutToDisappear(): void {
    if (BoostResultHub.nativeCallback) {
      const result: Record<string, Object> = createStringMap()
      result['data'] = '原生回复数据给Flutter'
      BoostResultHub.nativeCallback('/native-page', result)
      BoostResultHub.nativeCallback = undefined
    }
  }

  build() {
    NavDestination() {
      Column({ space: 16 }) {
        Text(this.data)
          .fontSize(20)
          .textAlign(TextAlign.Center)
        Button('返回')
          .onClick(() => {
            const result: Record<string, Object> = createStringMap()
            result['data'] = '原生回复数据给Flutter'
            HostRouter.pop(result)
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .padding(24)
      .backgroundColor('#F9F6F7')
    }
    .hideTitleBar(true)
  }
}
