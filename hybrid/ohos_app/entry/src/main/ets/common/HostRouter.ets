import { createStringMap } from './ParamsMap'

/** FlutterBoost 打开结果回调 */
export type PageResultCallback = (pageName: string, result: Record<string, Object>) => void

/** FlutterBoost 官方 example 要求的路由参数结构，uri/params/uniqueId 名字不能改 */
export class RouterOptions {
  uri: string
  params: Record<string, Object>
  uniqueId: string | null = null
  /** 宿主展示形态：transparent=普通透明页，dialog=弹窗页 */
  displayMode: string = 'transparent'

  constructor(uri: string, params: Record<string, Object>, uniqueId: string | null) {
    this.uri = uri
    this.params = params
    this.uniqueId = uniqueId
  }
}

/**
 * 鸿蒙侧统一 Navigation 栈。FlutterBoost 官方 example 也是在根页面持有
 * NavPathStack，并通过 RouterModule 转发 push/pop。
 */
export class BoostDisplayMode {
  static readonly TRANSPARENT: string = 'transparent'
  static readonly DIALOG: string = 'dialog'
}

export class HostRouter {
  static routeStack: NavPathStack | null = null

  static setRouteStack(stack: NavPathStack): void {
    HostRouter.routeStack = stack
  }

  static push(name: string, options: RouterOptions | Record<string, Object> = createStringMap(),
    onPageResult?: (pageName: string, result: Record<string, Object>) => void): void {
    if (HostRouter.routeStack === null) {
      console.error('HostRouter.routeStack is null')
      return
    }

    if (onPageResult === undefined) {
      HostRouter.routeStack.pushPath(new NavPathInfo(name, options))
      return
    }

    const resultCallback = onPageResult
    HostRouter.routeStack.pushPath(new NavPathInfo(name, options, (popInfo: PopInfo) => {
      let result: Record<string, Object> = createStringMap()
      if (popInfo !== undefined && popInfo.result !== undefined) {
        result = popInfo.result as Record<string, Object>
      }
      // FlutterBoost 需要拿到 Dart 页面 uri，而不是宿主页组件名
      const pageName = options instanceof RouterOptions ? options.uri : name
      resultCallback(pageName, result)
    }))
  }

  static pop(result: Record<string, Object> = createStringMap()): void {
    if (HostRouter.routeStack === null) {
      return
    }
    HostRouter.routeStack.pop(result)
  }
}

export class HostRouteNames {
  static readonly OFFICIAL: string = 'OfficialIntegrationPage'
  static readonly EXISTING_FLUTTER: string = 'ExistingFlutterPage'
  static readonly OFFICIAL_FLUTTER: string = 'OfficialFlutterPage'
  static readonly OFFICIAL_FLUTTER_DIALOG: string = 'OfficialFlutterDialogPage'
  static readonly FLUTTER_BOOST: string = 'FlutterBoostIntegrationPage'
  static readonly FLUTTER_BOOST_HOST: string = 'FlutterBoostHost'
  static readonly FLUTTER_BOOST_DIALOG: string = 'FlutterBoostDialogPage'
  static readonly FLUTTER_BOOST_TRANSPARENT: string = 'FlutterBoostTransparentPage'
  static readonly OTHER: string = 'OtherPage'
}
