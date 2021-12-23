import 'package:app/pages/main_activity.dart';
import 'package:dokit/dokit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  DoKit.runApp(
    app: DoKitApp(MyApp()),
    // appCreator: () => Future.value(DoKitApp(MyApp())),
    // 是否在release包内使用，默认release包会禁用
    useInRelease: false,
    releaseAction: () => {
      // release模式下执行该函数，一些用到runZone之类实现的可以放到这里，该值为空则会直接调用系统的runApp(MyApp())，
    },
    exceptionCallback: (dynamic error, StackTrace stack) {
      /// 捕获异常
    },
    logCallback: (String line) {
      /// 可以获取所有的print日志信息
    },
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Diy',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MainActivity(),
    );
  }
}
