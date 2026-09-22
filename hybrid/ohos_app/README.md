# ohos_app

HarmonyOS 原生宿主，把 `hybrid/flutter_module` 嵌进现有应用。演示内容和 Android / iOS 宿主对齐：

1. 官方 Add-to-App：缓存引擎、页面内嵌、透明 Ability、透明弹窗
2. FlutterBoost：原生打开 Flutter、Flutter 打开原生、透明弹窗、双向传参

## 打开方式

用 DevEco Studio 打开 `hybrid/ohos_app`，签名后运行到鸿蒙设备。

首次打开前先在仓库根目录执行 Flutter 依赖同步，让 `flutter_module/.ohos` 和插件 HAR 就绪。

`flutter_boost` 使用官方 git `main`（当前 4.6.5）。`v5.0.2` 没有鸿蒙原生插件，所以鸿蒙不能用那个 tag。
