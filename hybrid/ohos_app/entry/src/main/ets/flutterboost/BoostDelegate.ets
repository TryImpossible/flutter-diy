import {
  FlutterBoostDelegate,
  FlutterBoostRouteOptions
} from 'flutter_boost'
import { BOOST_NATIVE_PAGE } from '../common/Constants'
import {
  BoostDisplayMode,
  HostRouter,
  HostRouteNames,
  RouterOptions
} from '../common/HostRouter'

/** 原生页关闭时把结果回给 FlutterBoost */
export class BoostResultHub {
  static nativeCallback: ((pageName: string, result: Record<string, Object>) => void) | undefined = undefined
}

/** 临时记录下一次透明 Flutter 页面希望使用的宿主展示形态 */
export class BoostDisplayHub {
  static displayMode: string = BoostDisplayMode.TRANSPARENT
}

/**
 * FlutterBoost 路由代理，对齐 Android 两类透明容器：
 * 透明 Activity 和 DialogFragment。
 */
export class HostBoostDelegate implements FlutterBoostDelegate {
  pushNativeRoute(options: FlutterBoostRouteOptions,
    onPageResult?: (pageName: string, result: Record<string, Object>) => void): void {
    const pageName = options.getPageName()
    if (pageName === BOOST_NATIVE_PAGE) {
      BoostResultHub.nativeCallback = onPageResult
      HostRouter.push(HostRouteNames.OTHER, options.getArguments(), onPageResult)
    }
  }

  pushFlutterRoute(options: FlutterBoostRouteOptions,
    onPageResult?: (pageName: string, result: Record<string, Object>) => void): void {
    let routerName = HostRouteNames.FLUTTER_BOOST_HOST
    const displayMode = BoostDisplayHub.displayMode
    if (!options.isOpaque()) {
      routerName = displayMode === BoostDisplayMode.DIALOG ?
        HostRouteNames.FLUTTER_BOOST_DIALOG : HostRouteNames.FLUTTER_BOOST_TRANSPARENT
      // 只消费一次，避免影响后续 Dart 侧发起的透明页
      BoostDisplayHub.displayMode = BoostDisplayMode.TRANSPARENT
    }

    const uniqueId = options.getUniqueId()
    const routeOptions = new RouterOptions(
      options.getPageName(),
      options.getArguments(),
      uniqueId === null ? null : uniqueId
    )
    routeOptions.displayMode = displayMode
    HostRouter.push(routerName, routeOptions, onPageResult)
  }

  popRoute(_options: FlutterBoostRouteOptions): boolean {
    return false
  }
}
