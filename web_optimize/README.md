# Web Optimize

Web Optimize 工程介绍了如何做 Flutter Web 的加载优化？主要从大文件分片下载、资源文件hash化和资源文件cdn化
三方面去实现。

## 用法
```shell
Usage: cli webOptimize [arguments]
-h, --help                     Print this usage information.
    --assetBase (mandatory)    asset base url，end with /，eq：http://192.168.1.3:9091/
```
目前加载优化基本是使用`dart`实现的，已经开发成命令行程序了，具体实现参考
`cli/web_optimize.dart`。使用的话，直接在工程根目录下执行`dart cli/executable.dart webOptimize --assetBase http://192.168.1.3:9091/`,
其中`assetBase`参数是必传的，一般是使用cdn的地址，**地址必须是/结尾**

## 实现

```dart
@override
final Directory outputDir = Directory(webArtifactsOutputDir);
if (!outputDir.existsSync()) {
  // 构建产物目录不存在，直接退出
  exit(1);
}

for (File file in outputDir.listSync().whereType<File>()) {
  if (path.basename(file.path) == 'main.dart.js') {
    await _splitMainDartJS(file);
  }
}

_hashAssets();

_cdnAssets();

_injectToHtml();

_replaceFlutterJS();
```
`web_optimize`的实现步骤如下：
1. main.dart.js 文件切片
2. 资源文件hash化
3. 资源文件cdn化
4. 往`index.html`注入script
5. 替换`flutter.js`模板文件

## 最后
详细的优化实现请参考[Flutter Web 在《一起漫部》的性能优化探索与实践](https://juejin.cn/post/7149441892994777125)