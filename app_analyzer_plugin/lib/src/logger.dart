import 'dart:io';

import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

abstract class AppAnalyzerPluginLogger {
  /// 是否初始化
  static bool _initialized = false;

  /// 初始化
  static void init(String root) {
    final String path = p.join(root, 'app_analyzer_plugin.log');
    final File file = File(path);
    if (!file.parent.existsSync()) {
      throw StateError('When initializing file logger, ${file.parent} must exist.');
    }

    if (_initialized) {
      return;
    }
    _initialized = true;

    IOSink fileSink = file.openWrite(mode: FileMode.append);
    Logger.root.clearListeners();
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
      try {
        fileSink.writeln('${record.time} ${record.level.name} ${record.loggerName} - ${record.message}');
      } catch (error, stackTrace) {
        fileSink.writeln('error while writing log $error $stackTrace');
      }
    });
  }

  static Logger create(String name) => Logger(name);
}
