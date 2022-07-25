import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawImagePage extends StatelessWidget {
  const DrawImagePage({Key? key}) : super(key: key);

  /// 通过assets路径，获取资源图片（不能设置大小）
  // Future<ui.Image> _loadAssetImage() async {
  //   ByteData data = await rootBundle.load('assets/images/suolong.jpeg');
  //   Uint8List bytes =
  //       data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  //   ui.Image image = await decodeImageFromList(bytes);
  //   return image;
  // }

  /// 通过assets路径，获取资源图片（可以设置大小）
  Future<ui.Image> _loadAssetImage(String asset, Size size) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: size.width.toInt(),
      targetHeight: size.height.toInt(),
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ['Demo1', 'Demo2', 'Demo3', 'Demo4'];

    final Size size = MediaQuery.of(context).size;
    final Size imageSize = Size.square(size.width / 3);
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DrawImage'),
          bottom: TabBar(
            isScrollable: true,
            tabs: tabs.map((String title) {
              return Tab(text: title);
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: tabs.map((String title) {
            return Center(
              child: ColoredBox(
                color: Colors.grey.shade300,
                child: FutureBuilder<ui.Image>(
                  future: _loadAssetImage(
                    'assets/images/suolong.jpeg',
                    imageSize,
                  ),
                  builder: (_, AsyncSnapshot<ui.Image> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (title == 'Demo1') {
                        return CustomPaint(
                          painter: _MyPainter1(
                            image: snapshot.data!,
                            imageSize: imageSize,
                          ),
                          size: Size.square(size.width),
                        );
                      } else if (title == 'Demo2') {
                        return SingleChildScrollView(
                          child: CustomPaint(
                            painter: _MyPainter2(
                              image: snapshot.data!,
                              imageSize: imageSize,
                            ),
                            size: Size(
                              size.width,
                              imageSize.height *
                                  (BlendMode.values.length / 3).ceil(),
                            ),
                          ),
                        );
                      } else if (title == 'Demo3') {
                        return CustomPaint(
                          painter: _MyPainter3(
                            image: snapshot.data!,
                            imageSize: imageSize,
                          ),
                          size: Size.square(size.width),
                        );
                      } else if (title == 'Demo4') {
                        return CustomPaint(
                          painter: _MyPainter4(
                            image: snapshot.data!,
                            imageSize: imageSize,
                          ),
                          size: Size.square(size.width),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    } else {
                      // 请求未结束，显示loadign
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _MyPainter1 extends CustomPainter {
  _MyPainter1({
    required this.image,
    required this.imageSize,
  });

  final ui.Image image;
  final Size imageSize;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    canvas.drawImage(image, Offset.zero, paint);

    canvas.save();
    canvas.translate(size.width - imageSize.width * 0.5, 0);
    paint.imageFilter =
        ui.ImageFilter.matrix(Matrix4.diagonal3Values(0.5, 0.5, 1).storage);
    canvas.drawImage(image, Offset.zero, paint);
    canvas.restore();

    canvas.save();
    canvas.translate(0, imageSize.width + 10);
    paint.imageFilter = ui.ImageFilter.blur(sigmaX: 1, sigmaY: 1);
    canvas.drawImage(image, Offset.zero, paint);
    canvas.restore();

    canvas.translate(size.width - imageSize.width, imageSize.height + 10);
    paint.imageFilter = ui.ImageFilter.blur(sigmaX: 2, sigmaY: 2);
    canvas.drawImage(image, Offset.zero, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _MyPainter2 extends CustomPainter {
  _MyPainter2({
    required this.image,
    required this.imageSize,
  });

  final ui.Image image;
  final Size imageSize;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    for (int i = 0; i < BlendMode.values.length; i++) {
      canvas.save();

      final int row = (i / 3).floor();
      final int column = i % 3;
      final double dx = imageSize.width * column;
      final double dy = imageSize.height * row;
      canvas.translate(dx, dy);

      final BlendMode mode = BlendMode.values[i];
      paint.colorFilter = ui.ColorFilter.mode(Colors.redAccent, mode);
      canvas.drawImage(image, Offset.zero, paint);

      /// 画文字
      final TextPainter textPainter =
          TextPainter(textDirection: TextDirection.ltr);
      textPainter.text = TextSpan(
        text: mode.toString().replaceAll('BlendMode.', ''),
        style: const TextStyle(fontSize: 20, color: Colors.black),
      );
      textPainter.layout(maxWidth: imageSize.width);
      textPainter.paint(
          canvas,
          Offset(
            (imageSize.width - textPainter.size.width) / 2,
            (imageSize.height - textPainter.size.height) / 2,
          ));

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _MyPainter3 extends CustomPainter {
  _MyPainter3({
    required this.image,
    required this.imageSize,
  });

  final ui.Image image;
  final Size imageSize;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    // 直接绘制原图
    canvas.drawImage(image, Offset.zero, paint);
    // 绘制放大0.5倍的.9图片
    canvas.drawImageNine(
      image,
      const Rect.fromLTWH(55, 30, 50, 80),
      Rect.fromLTWH(
        imageSize.width,
        imageSize.height,
        imageSize.width * 1.5,
        imageSize.height * 1.5,
      ),
      paint,
    );
    // 绘制缩小一倍的.9图片
    canvas.drawImageNine(
      image,
      const Rect.fromLTWH(55, 30, 10, 10),
      Rect.fromLTWH(0, 300, imageSize.width / 2, imageSize.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _MyPainter4 extends CustomPainter {
  _MyPainter4({
    required this.image,
    required this.imageSize,
  });

  final ui.Image image;
  final Size imageSize;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    // 直接绘制原图
    canvas.drawImage(image, Offset.zero, paint);

    // 在200*0 的位置绘制左眼
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(55, 87, 30, 30),
      Rect.fromLTWH(200, 0, 30, 30),
      paint,
    );

    // // 在200*50 的位置绘制左眼
    // canvas.drawImageRect(
    //   image,
    //   Rect.fromLTWH(55, 57, 10, 10),
    //   Rect.fromLTWH(200, 50, 20, 20),
    //   paint,
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
