import 'dart:isolate';

import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:analyzer_plugin/starter.dart';

import 'plugin.dart';

abstract class AppAnalyzerPluginStarter {
  static void start(List<String> args, SendPort sendPort) {
    ServerPluginStarter(AppAnalyzerPlugin(resourceProvider: PhysicalResourceProvider.INSTANCE)).start(sendPort);
  }
}
