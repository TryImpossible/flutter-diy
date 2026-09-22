/**
 * ArkTS 不允许无类型 `{}` 和计算属性名，统一用这个方法建参数表。
 */
export function createStringMap(): Record<string, Object> {
  return new Object() as Record<string, Object>
}

/** FlutterBoost 打开页面时带的 uri / params / uniqueId */
export class BoostOpenOptions {
  uri: Object = ''
  params: Object = createStringMap()
  uniqueId: Object = ''
}
