/** 官方 Add-to-App 预热引擎在缓存中的 id，需与 Android 保持一致 */
export const OFFICIAL_ENGINE_ID: string = 'my_engine_id'

/** 官方集成 Dart 入口参数，对应 flutter_module 的 --mode=official */
export const OFFICIAL_DART_ARGS: string[] = ['--mode=official']

/** FlutterBoost Dart 入口参数，对应 flutter_module 的 --mode=flutterboost */
export const FLUTTER_BOOST_DART_ARGS: string[] = ['--mode=flutterboost']

/** 官方透明弹窗的 Flutter 路由名 */
export const OFFICIAL_DIALOG_ROUTE: string = 'dialog'

/** FlutterBoost 主页面路由 */
export const BOOST_MAIN_PAGE: string = '/main-page'

/** FlutterBoost 透明弹窗路由 */
export const BOOST_DIALOG_PAGE: string = '/dialog-page'

/** FlutterBoost 打开原生页的路由 */
export const BOOST_NATIVE_PAGE: string = '/native-page'
