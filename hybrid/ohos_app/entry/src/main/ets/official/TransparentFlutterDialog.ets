import { FlutterAbilityLaunchConfigs } from '@ohos/flutter_ohos'
import { FlutterEmbedView } from '../common/FlutterEmbedView'
import { createStringMap } from '../common/ParamsMap'
import { OFFICIAL_DART_ARGS, OFFICIAL_DIALOG_ROUTE } from '../common/Constants'

/**
 * 透明弹窗里嵌 Flutter，对应 Android TransparentFlutterDialogFragment。
 */
@CustomDialog
export struct TransparentFlutterDialog {
  controller?: CustomDialogController
  private dialogParams: Record<string, Object> = TransparentFlutterDialog.buildDialogParams()

  /** 组装透明 Flutter 弹窗的引擎启动参数 */
  private static buildDialogParams(): Record<string, Object> {
    const params: Record<string, Object> = createStringMap()
    params[FlutterAbilityLaunchConfigs.EXTRA_DART_ENTRYPOINT_ARGS] = OFFICIAL_DART_ARGS
    params[FlutterAbilityLaunchConfigs.EXTRA_INITIAL_ROUTE] = OFFICIAL_DIALOG_ROUTE
    params[FlutterAbilityLaunchConfigs.EXTRA_BACKGROUND_MODE] = 'transparent'
    return params
  }

  build() {
    Column() {
      FlutterEmbedView({ params: this.dialogParams })
    }
    .width('100%')
    .height(300)
    .backgroundColor(Color.Transparent)
  }
}
