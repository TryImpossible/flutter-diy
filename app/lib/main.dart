import 'package:app/main_page.dart';
// import 'package:dokit/dokit.dart';
// import 'package:dokit/kit/biz/biz.dart';
import 'package:flutter/material.dart';

void main() {
  // //1.创建绘制记录器和Canvas
  // PictureRecorder recorder = PictureRecorder();
  // Canvas canvas = Canvas(recorder);
  // canvas.drawColor(Colors.red, BlendMode.color);
  // //2.在指定位置区域绘制。
  // var rect = Rect.fromLTWH(30, 200, 300,300 );
  // // drawChessboard(canvas,rect); //画棋盘
  // // drawPieces(canvas,rect);//画棋子
  // //3.创建layer，将绘制的产物保存在layer中
  // var pictureLayer = PictureLayer(rect);
  // //recorder.endRecording()获取绘制产物。
  // pictureLayer.picture = recorder.endRecording();
  // var rootLayer = OffsetLayer();
  // rootLayer.append(pictureLayer);
  // //4.上屏，将绘制的内容显示在屏幕上。
  // final SceneBuilder builder = SceneBuilder();
  // final Scene scene = rootLayer.buildScene(builder);
  // window.render(scene);

  // DoKit.runApp(
  //   app: DoKitApp(MyApp()),
  //   // appCreator: () => Future.value(DoKitApp(MyApp())),
  //   // 是否在release包内使用，默认release包会禁用
  //   useInRelease: false,
  //   releaseAction: () => {
  //     // release模式下执行该函数，一些用到runZone之类实现的可以放到这里，该值为空则会直接调用系统的runApp(MyApp())，
  //   },
  //   exceptionCallback: (dynamic error, StackTrace stack) {
  //     /// 捕获异常
  //   },
  //   logCallback: (String line) {
  //     /// 可以获取所有的print日志信息
  //   },
  // );
  // BizKitManager.instance.buildBizKit(
  //   group: '业务工具',
  //   name: '测试入口',
  //   desc: '业务。。。',
  //   kitBuilder: () {
  //     return Container(color: Colors.orange);
  //   },
  // );
  runApp(const MyApp());

  // runFoundationUI();
  // runRenderObjectUI();
  // runWidgetUI();

  // runSketchPadExample08();
  // runSketchPadExample09();
  // runSketchPadExample10();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
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
      home: const MainPage(),
      builder: (_, Widget? child) {
        return Stack(
          children: <Widget>[
            child!,
            const Banner(message: 'DEBUG', location: BannerLocation.topStart),
          ],
        );
      },
    );
  }
}
