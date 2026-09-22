import { OfficialIntegrationPage } from './OfficialIntegrationPage'
import { FlutterBoostIntegrationPage } from './FlutterBoostIntegrationPage'
import { ExistingFlutterPage } from './ExistingFlutterPage'
import { OfficialFlutterPage } from './OfficialFlutterPage'
import { OfficialFlutterDialogPage } from './OfficialFlutterDialogPage'
import { FlutterBoostHost } from './FlutterBoostHost'
import { FlutterBoostTransparentPage } from './FlutterBoostTransparentPage'
import { FlutterBoostDialogPage } from './FlutterBoostDialogPage'
import { OtherPage } from './OtherPage'
import { HostRouter, HostRouteNames, RouterOptions } from '../common/HostRouter'

/**
 * 鸿蒙宿主首页，对应 Android MainActivity / iOS ContentView。
 */
@Entry
@Component
struct Index {
  /** 全应用共用的 Navigation 栈，子页都往这里 push */
  private pageStack: NavPathStack = new NavPathStack()

  aboutToAppear(): void {
    HostRouter.setRouteStack(this.pageStack)
  }

  @Builder
  destinationBuilder(name: string, param: Object) {
    if (name === HostRouteNames.OFFICIAL) {
      OfficialIntegrationPage()
    } else if (name === HostRouteNames.FLUTTER_BOOST) {
      FlutterBoostIntegrationPage()
    } else if (name === HostRouteNames.EXISTING_FLUTTER) {
      ExistingFlutterPage()
    } else if (name === HostRouteNames.OFFICIAL_FLUTTER) {
      OfficialFlutterPage()
    } else if (name === HostRouteNames.OFFICIAL_FLUTTER_DIALOG) {
      OfficialFlutterDialogPage()
    } else if (name === HostRouteNames.FLUTTER_BOOST_HOST) {
      FlutterBoostHost({ routerOptions: param as RouterOptions })
    } else if (name === HostRouteNames.FLUTTER_BOOST_TRANSPARENT) {
      FlutterBoostTransparentPage({ routerOptions: param as RouterOptions })
    } else if (name === HostRouteNames.FLUTTER_BOOST_DIALOG) {
      FlutterBoostDialogPage({ routerOptions: param as RouterOptions })
    } else if (name === HostRouteNames.OTHER) {
      OtherPage({ routeParam: param })
    } else {
      Column()
    }
  }

  build() {
    Navigation(this.pageStack) {
      Column({ space: 16 }) {
        Button('官方的集成方式')
          .width('70%')
          .onClick(() => {
            HostRouter.push(HostRouteNames.OFFICIAL)
          })
        Button('FlutterBoost的集成方式')
          .width('70%')
          .onClick(() => {
            HostRouter.push(HostRouteNames.FLUTTER_BOOST)
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .backgroundColor('#F9F6F7')
    }
    .mode(NavigationMode.Stack)
    .hideTitleBar(true)
    .navDestination(this.destinationBuilder)
  }

  onBackPress(): boolean {
    return false
  }
}
