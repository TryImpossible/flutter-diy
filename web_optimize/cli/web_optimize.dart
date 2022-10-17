import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:args/command_runner.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;
import 'package:path/path.dart' as path;
import 'package:tencent_cos_plus/tencent_cos_plus.dart';

class WebOptimizeCommand extends Command<void> {
  WebOptimizeCommand() {
    argParser.addOption(
      'assetBase',
      help: 'asset base url，end with /，eq：http://192.168.1.3:9091/',
      mandatory: true,
    );
  }

  @override
  String get description => 'web optimize tool';

  @override
  String get name => 'webOptimize';

  /// cli路径
  final String webAssetDir = '${Directory.current.path}/cli';

  /// Web构建产物路径
  final String webArtifactsOutputDir = '${Directory.current.path}/build/web';

  /// 哈希化后的js文件
  Map<String, String> jsManifest = <String, String>{};

  /// 资源路径，一般是cdn地址
  String get assetBase => argResults!['assetBase'];

  /// 需要上传的文件
  List<String> toUploadFiles = <String>[];

  @override
  FutureOr<void> run() async {
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

    await _cdnAssets();

    _injectToHtml();

    _replaceFlutterJS();
  }

  /// 拆分 main.dart.js
  Future<void> _splitMainDartJS(File file) async {
    // 写入单个文件
    Future<bool> writeSingleFile({
      required File file,
      required String filename,
      required int startIndex,
      required endIndex,
    }) {
      final Completer<bool> completer = Completer();
      final File f = File(path.join(file.parent.path, filename));
      if (f.existsSync()) {
        f.deleteSync();
      }
      final RandomAccessFile raf = f.openSync(mode: FileMode.write);
      final Stream<List<int>> inputStream = file.openRead(startIndex, endIndex);
      inputStream.listen(
        (List<int> data) {
          raf.writeFromSync(data);
        },
        onDone: () {
          raf.flushSync();
          raf.closeSync();
          completer.complete(true);
        },
        onError: (dynamic data) {
          raf.flushSync();
          raf.closeSync();
          completer.completeError(data);
        },
      );
      return completer.future;
    }

    const int totalChunk = 6;
    final Uint8List bytes = file.readAsBytesSync();
    int chunkSize = (bytes.length / totalChunk).ceil();
    final List<Future<bool>> futures = List<Future<bool>>.generate(
      totalChunk,
      (int index) {
        return writeSingleFile(
          file: file,
          filename: 'main.dart_$index.js',
          startIndex: index * chunkSize,
          endIndex: (index + 1) * chunkSize,
        );
      },
    );

    await Future.wait(futures);

    /// 分片完成后删除 main.dart.js
    file.deleteSync();
  }

  /// 资源hash化
  void _hashAssets() {
    /// md5
    String md5(File file) {
      final Uint8List bytes = file.readAsBytesSync();
      // 截取8位即可
      final md5Hash = crypto.md5.convert(bytes).toString().substring(0, 8);

      // 文件名使用hash值
      final basename = path.basenameWithoutExtension(file.path);
      final extension = path.extension(file.path);
      return '$basename.$md5Hash$extension';
    }

    /// 替换
    String replace(
      Match match,
      File file,
      String key,
      Map<String, String> hashFiles,
    ) {
      // 文件名使用hash值
      final String filename = md5(file);
      final dirname = path.dirname(key);
      final String newKey = path.join(dirname, filename);

      // hash文件路径
      final String newPath = path.join(path.dirname(file.path), filename);
      hashFiles[file.path] = newPath;

      return '${match[1]}$newKey${match[3]}';
    }

    // 读取资源清单文件
    final File assetManifest =
        File('$webArtifactsOutputDir/assets/AssetManifest.json');
    String assetManifestContent = assetManifest.readAsStringSync();
    // 读取字体清单文件
    final File fontManifest =
        File('$webArtifactsOutputDir/assets/FontManifest.json');
    String fontManifestContent = fontManifest.readAsStringSync();

    // 遍历assets目录
    final Directory assetsDir = Directory(webArtifactsOutputDir);
    Map<String, String> hashFiles = <String, String>{};
    assetsDir
        .listSync(recursive: true)
        .whereType<File>() // 文件类型
        .where((File file) => !path.basename(file.path).startsWith('.'))
        .forEach((File file) {
      if (RegExp(r'main.dart(.*)\.js$').hasMatch(file.path)) {
        // 替换资js文件
        final String filename = md5(file);
        hashFiles[file.path] = path.join(path.dirname(file.path), filename);
        jsManifest[path.basename(file.path)] = filename;
      }

      if (file.path.contains('$webArtifactsOutputDir/assets')) {
        final String key =
            path.relative(file.path, from: '$webArtifactsOutputDir/assets');
        // 替换资源清单文件
        assetManifestContent = assetManifestContent.replaceAllMapped(
          RegExp('(.*)($key)(.*)'),
          (Match match) => replace(match, file, key, hashFiles),
        );
        // 替换字体清单文件
        fontManifestContent = fontManifestContent.replaceAllMapped(
          RegExp('(.*)($key)(.*)'),
          (Match match) => replace(match, file, key, hashFiles),
        );
      }
    });

    // 重命名文件
    hashFiles.forEach((String key, String value) {
      File(key).renameSync(value);
    });

    // 写入资源、字体清单文件
    assetManifest.writeAsStringSync(assetManifestContent);
    fontManifest.writeAsStringSync(fontManifestContent);

    // 收集需要上传的文件
    toUploadFiles = hashFiles.values.toList();
    toUploadFiles.add(assetManifest.path);
    toUploadFiles.add(fontManifest.path);
  }

  /// 资源cdn化
  Future<void> _cdnAssets() async {
    COSApiFactory.initialize(
      config: COSConfig(
        appId: 'xxx',
        secretId: 'xxx',
        secretKey: 'xxx',
      ),
      bucketName: 'xxx',
      region: 'xxx',
    );

    // cdn的前缀路径
    final Uri uri = Uri.parse(assetBase);
    final String cdnPrefixPath = uri.path.substring(1);

    // 查询历史版本
    final COSListBucketResult buckets =
        await COSApiFactory.objectApi.listObjects(prefix: cdnPrefixPath);

    if (buckets.contents?.isNotEmpty ?? false) {
      // 删除历史版本
      final List<COSObject> objects =
          buckets.contents!.map<COSObject>((COSContents content) {
        print('to delete file: ${content.key}');
        return COSObject(key: content.key ?? '');
      }).toList();
      final COSDelete delete = COSDelete(quiet: false, objects: objects);
      await COSApiFactory.objectApi.deleteMultipleObjects(delete: delete);
    }

    // 上传当前版本至cos
    final List<Future<dynamic>> tasks =
        toUploadFiles.map<Future<dynamic>>((String filePath) {
      String objectKey = path.relative(filePath, from: webArtifactsOutputDir);
      objectKey = '$cdnPrefixPath$objectKey';
      print('to upload file: $objectKey');
      return COSApiFactory.objectApi.putObject(
        objectKey: objectKey,
        filePath: filePath,
      );
    }).toList();
    await Future.wait(tasks);

    // Directory(webArtifactsOutputDir)
    //     .listSync(recursive: true)
    //     .whereType<File>()
    //     .forEach((File file) {
    //   final String partPath =
    //       path.relative(file.path, from: webArtifactsOutputDir);
    //   final String filePath =
    //       path.join('${Directory.current.path}/build/cdn', partPath);
    //   File(filePath).createSync(recursive: true);
    //   file.copySync(filePath);
    // });
  }

  /// 向 index.html 注入
  void _injectToHtml() {
    final File file = File('$webArtifactsOutputDir/index.html');
    final String contents = file.readAsStringSync();
    final Document document = parse(contents);

    /// 注入meta标签
    final List<Element> metas = document.getElementsByTagName('meta');
    final Element? headElement = document.head;
    if (headElement != null) {
      final Element meta = Element.tag('meta');
      meta.attributes['name'] = 'assetBase';
      meta.attributes['content'] = assetBase;

      if (metas.isNotEmpty) {
        final Element lastMeta = metas.last;
        lastMeta.append(Text('\n'));
        lastMeta.append(Comment('content值必须以 / 结尾'));
        lastMeta.append(Text('\n'));
        lastMeta.append(meta);
      } else {
        headElement.append(Comment('content值必须以 / 结尾'));
        headElement.append(Text('\n'));
        headElement.append(meta);
        headElement.append(Text('\n'));
      }
    }

    /// 注入script
    String dartDeferredLibraryLoader = r'''
    // auto-generate, dont edit!!!!!!
    var assetBase = null;
    var jsManifest = null;
    function dartDeferredLibraryLoader(uri, successCallback, errorCallback, loadId) {
      console.info('===>', uri, successCallback, errorCallback, loadId);
      
      let src;
      try {
        const url = new URL(uri);
        src = `${assetBase}${jsManifest[url.pathname.substring(1)]}`;
      } catch (e) {
        src = `${assetBase}${jsManifest[uri.substring(1)]}`;
      }
      
      script = document.createElement("script");
      script.type = "text/javascript";
      script.src = src;
      script.addEventListener("load", successCallback, false);
      script.addEventListener("error", errorCallback, false);
      document.body.appendChild(script);
    }
    '''
        .replaceAll(
            RegExp('var assetBase = null;'), 'var assetBase = "$assetBase";')
        .replaceAll(
          RegExp('var jsManifest = null;'),
          'var jsManifest = ${jsonEncode(jsManifest)};',
        );
    final List<Element> scripts = document.getElementsByTagName('script');
    // 是否注入js
    bool isInjected = false;
    for (int i = 0; i < scripts.length; i++) {
      final Element element = scripts[i];
      if (element.text.contains(RegExp(r'var serviceWorkerVersion'))) {
        element.text = '${element.text}\n$dartDeferredLibraryLoader';
        isInjected = true;
        break;
      }
    }
    if (!isInjected) {
      final Element? headElement = document.head;
      if (headElement != null) {
        final Element script = Element.tag('script');
        script.text = '\n$dartDeferredLibraryLoader';

        if (scripts.length > 1) {
          final Element firstScript = scripts.first;
          headElement.insertBefore(script, firstScript);
          headElement.insertBefore(Text('\n'), firstScript);
        } else {
          headElement.append(script);
          headElement.append(Text('\n'));
        }
      }
    }

    // 写入文件
    file.writeAsStringSync(document.outerHtml);
  }

  /// 替换 flutter.js
  void _replaceFlutterJS() {
    final String contents = File('$webAssetDir/flutter.js').readAsStringSync();
    File('$webArtifactsOutputDir/flutter.js').writeAsStringSync(contents);
  }
}
