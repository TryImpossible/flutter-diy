import { FlutterEngine, FlutterEngineCache } from '@ohos/flutter_ohos'
import { DartEntrypoint } from '@ohos/flutter_ohos/src/main/ets/embedding/engine/dart/DartExecutor'
import { GeneratedPluginRegistrant } from '@ohos/flutter_module'
import { common } from '@kit.AbilityKit'
import { OFFICIAL_DART_ARGS, OFFICIAL_ENGINE_ID } from '../common/Constants'

/**
 * 按官方 Add-to-App 方式预热并缓存 FlutterEngine。
 * 对应 Android MainApplication.initFlutterByOfficial()。
 */
export function initOfficialFlutterEngine(context: common.Context): void {
  const cache = FlutterEngineCache.getInstance()
  if (cache.contains(OFFICIAL_ENGINE_ID)) {
    return
  }

  // 先创建并 init，再注册插件、跑 Dart，避免首帧前插件丢失
  const engine: FlutterEngine = new FlutterEngine(context, null, null, null)
  engine.init(context, null, false)
  GeneratedPluginRegistrant.registerWith(engine)
  engine.getDartExecutor().executeDartEntrypoint(DartEntrypoint.createDefault(), OFFICIAL_DART_ARGS)
  cache.put(OFFICIAL_ENGINE_ID, engine)
}
