import 'package:args/command_runner.dart';

import 'web_optimize.dart';

final _mockCmdArgs = ['webOptimize', '--assetBase', 'http://192.168.1.3:9091/'];

void main(List<String> arguments) {
  CommandRunner('cli', 'cli description')
    ..addCommand(WebOptimizeCommand())
    // ..run(_mockCmdArgs);
    ..run(arguments);
}
