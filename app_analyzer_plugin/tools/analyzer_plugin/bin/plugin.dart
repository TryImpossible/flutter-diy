import 'dart:isolate';

import 'package:app_analyzer_plugin/app_analyzer_plugin.dart';

// This file must be 'plugin.dart'
void main(List<String> args, SendPort sendPort) {
  AppAnalyzerPluginStarter.start(args, sendPort);
}
