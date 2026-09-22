import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit'
import { window } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'
import hilog from '@ohos.hilog'
import { FlutterEngine, FlutterManager } from '@ohos/flutter_ohos'
import ApplicationInfoLoader from '@ohos/flutter_ohos/src/main/ets/embedding/engine/loader/ApplicationInfoLoader'
import { FlutterBoost, FlutterBoostSetupOptions, FlutterBoostSetupOptionsBuilder } from 'flutter_boost'
import { GeneratedPluginRegistrant } from '@ohos/flutter_module'
import { initOfficialFlutterEngine } from '../official/OfficialFlutterEngine'
import { HostBoostDelegate } from '../flutterboost/BoostDelegate'
import { FLUTTER_BOOST_DART_ARGS } from '../common/Constants'

const TAG: string = 'EntryAbility'

/**
 * 原生宿主 Ability，对应 Android MainApplication + MainActivity。
 * 官方引擎与 FlutterBoost 引擎分开预热。
 */
export default class EntryAbility extends UIAbility {
  private boostDelegate: HostBoostDelegate = new HostBoostDelegate()

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, TAG, 'Ability onCreate')
    FlutterManager.getInstance().pushUIAbility(this)
    initOfficialFlutterEngine(this.context)
  }

  onDestroy(): void {
    hilog.info(0x0000, TAG, 'Ability onDestroy')
    FlutterManager.getInstance().popUIAbility(this)
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, TAG, 'Ability onWindowStageCreate')
    FlutterManager.getInstance().pushWindowStage(this, windowStage)

    // 对齐官方 example：引擎 setup 完成后再加载首页，避免首帧时 Dart 还没跑起来
    const applicationInfo = ApplicationInfoLoader.load(this.context)
    const options: FlutterBoostSetupOptions = new FlutterBoostSetupOptionsBuilder()
      .setDartEntrypointArgs(FLUTTER_BOOST_DART_ARGS)
      .setDebugLoggingEnabled(applicationInfo.isDebugMode)
      .build()

    FlutterBoost.getInstance().setup(this.boostDelegate, this.context, (engine: FlutterEngine) => {
      hilog.info(0x0000, TAG, 'FlutterBoost engine ready')
      GeneratedPluginRegistrant.registerWith(engine)

      windowStage.loadContent('pages/Index', (err: BusinessError) => {
        if (err.code) {
          hilog.error(0x0000, TAG, 'Failed to load Index: %{public}s', JSON.stringify(err))
          return
        }
        const mainWindow = windowStage.getMainWindowSync()
        mainWindow.setWindowLayoutFullScreen(true).catch((layoutErr: BusinessError) => {
          hilog.error(0x0000, TAG, 'set full screen failed: %{public}s', JSON.stringify(layoutErr))
        })
        // 窗口默认底色偏黑，透明 Flutter 页面会把它透出来；这里改成透明，
        // 让 NavDestination 弹窗层直接露出下层原生页面
        mainWindow.setWindowBackgroundColor('#00000000')
      })
    }, options)
  }

  onWindowStageDestroy(): void {
    FlutterManager.getInstance().popWindowStage(this)
  }

  onForeground(): void {
    FlutterBoost.getInstance().onForeground()
  }

  onBackground(): void {
    FlutterBoost.getInstance().onBackground()
  }
}
