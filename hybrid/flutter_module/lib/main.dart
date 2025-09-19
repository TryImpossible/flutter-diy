import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'official/app.dart' as official_app;
import 'flutter_boost/app.dart' as flutter_boost_app;

void main(List<String> arguments) {
  debugPrint('arguments: ${arguments.toString()}');
  final String mode = arguments
      .singleWhere((String item) => item.startsWith('--mode='), orElse: () => '--mode=official')
      .replaceAll('--mode=', '');
  if (mode == 'official') {
    runApp(const official_app.App());
  } else if (mode == 'flutterboost') {
    ///这里的CustomFlutterBinding调用务必不可缺少，用于控制Boost状态的resume和pause
    flutter_boost_app.CustomFlutterBinding();
    runApp(const flutter_boost_app.App());
  }
}
