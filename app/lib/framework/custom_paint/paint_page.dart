import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaintPage extends StatelessWidget {
  const PaintPage({Key? key}) : super(key: key);

  /// 通过assets路径，获取资源图片
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
    final Size size = MediaQuery.of(context).size;
    final Size paintSize = Size(size.width, size.width * .5);
    final Size imageSize = Size.square((paintSize.height - 30) / 2);
    return Scaffold(
      appBar: AppBar(title: Text('Paint')),
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder<ui.Image>(
            future: _loadAssetImage('assets/images/lufei.jpeg', imageSize),
            builder: (_, AsyncSnapshot<ui.Image> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CustomPaint(
                  painter: _MyPainter(
                    image: snapshot.data!,
                    imageSize: imageSize,
                  ),
                  size: Size(size.width, size.height * 2),
                );
              } else {
                // 请求未结束，显示loadign
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  _MyPainter({
    required this.image,
    required this.imageSize,
  });

  final ui.Image image;
  final Size imageSize;

  final double padding = 10;

  Paint _paint = Paint();

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    /// translate
    canvas.translate(0, padding);

    /// paint: color、style、strokeWidth
    _paint1(canvas, size);

    /// strokeCap、strokeJoin
    _paint2(canvas, size);

    /// colorFilter、blendMode
    _paint3(canvas, size);

    /// maskFilter
    _paint4(canvas, size);

    /// imageFilter、filterQuality
    _paint5(canvas, size);

    /// shader
    _paint6(canvas, size);
  }

  /// paint: color、style、strokeWidth
  void _paint1(ui.Canvas canvas, ui.Size size) {
    final double width = size.width;
    final double radius = 30;

    canvas.drawCircle(
      Offset(padding + radius, radius),
      radius,
      _paint
        ..color = Colors.red
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5,
    );
    canvas.drawCircle(
      Offset(width - padding - radius, radius),
      radius,
      _paint
        ..color = Colors.green
        ..style = PaintingStyle.fill,
    );
    canvas.translate(0, radius * 2 + padding * 2);
  }

  /// strokeCap、strokeJoin
  void _paint2(ui.Canvas canvas, ui.Size size) {
    final double lineSize = 50;

    _paint.strokeCap = StrokeCap.square;
    _paint.strokeJoin = StrokeJoin.bevel;
    _paint.strokeWidth = 10;
    _paint.color = Colors.red;
    canvas.drawLine(
      Offset(padding * 1 + lineSize * (1 - 1), 0),
      Offset(padding * 1 + lineSize * (2 - 1), 0),
      _paint,
    );
    canvas.drawLine(
      Offset(padding * 1 + lineSize * (2 - 1), 0),
      Offset(padding * 1 + lineSize * (2 - 1), lineSize),
      _paint,
    );

    _paint.strokeCap = StrokeCap.round;
    _paint.strokeJoin = StrokeJoin.round;
    canvas.drawLine(
      Offset(padding * 2 + lineSize * (2 - 1), 0),
      Offset(padding * 2 + lineSize * (3 - 1), 0),
      _paint,
    );
    canvas.drawLine(
      Offset(padding * 2 + lineSize * (3 - 1), 0),
      Offset(padding * 2 + lineSize * (3 - 1), lineSize),
      _paint,
    );

    _paint.strokeCap = StrokeCap.butt;
    _paint.strokeJoin = StrokeJoin.miter;
    canvas.drawLine(
      Offset(padding * 3 + lineSize * (3 - 1), 0),
      Offset(padding * 3 + lineSize * (4 - 1), 0),
      _paint,
    );
    canvas.drawLine(
      Offset(padding * 3 + lineSize * (4 - 1), 0),
      Offset(padding * 3 + lineSize * (4 - 1), lineSize),
      _paint,
    );
    canvas.translate(0, lineSize + padding * 2);
  }

  /// colorFilter、blendMode
  void _paint3(ui.Canvas canvas, ui.Size size) {
    /// 原始的
    _paint.colorFilter = ColorFilter.matrix(<double>[
      1, 0, 0, 0, 0, //
      0, 1, 0, 0, 0, //
      0, 0, 1, 0, 0, //
      0, 0, 0, 1, 0, //
    ]);
    canvas.drawImage(
      image,
      Offset(padding * 1 + imageSize.width * (1 - 1), 0),
      _paint,
    );

    /// 图片变暗
    _paint.colorFilter = ColorFilter.matrix(<double>[
      0.5, 0, 0, 0, 0, //
      0, 0.5, 0, 0, 0, //
      0, 0, 0.5, 0, 0, //
      0, 0, 0, 1, 0, //
    ]);
    canvas.drawImage(
      image,
      Offset(padding * 2 + imageSize.width * (2 - 1), 0),
      _paint,
    );

    /// 图片变暗
    _paint.colorFilter = ColorFilter.matrix(<double>[
      0.33, 0.59, 0.11, 0, 0, //
      0.33, 0.59, 0.11, 0, 0, //
      0.33, 0.59, 0.11, 0, 0, //
      0, 0, 0, 1, 0, //
    ]);
    canvas.drawImage(
      image,
      Offset(padding * 3 + imageSize.width * (3 - 1), 0),
      _paint,
    );

    /// 颜色反向效果
    _paint.colorFilter = ColorFilter.matrix(<double>[
      -1, 0, 0, 1, 1, //
      0, -1, 0, 1, 1, //
      0, 0, -1, 1, 1, //
      0, 0, 0, 1, 0, //
    ]);
    canvas.drawImage(
      image,
      Offset(padding * 4 + imageSize.width * (4 - 1), 0),
      _paint,
    );

    /// 复古效果（老照片效果）
    _paint.colorFilter = ColorFilter.matrix(<double>[
      0.393, 0.769, 0.189, 0, 0, //
      0.349, 0.696, 0.168, 0, 0, //
      0.272, 0.534, 0.131, 0, 0, //
      0, 0, 0, 1, 0, //
    ]);
    canvas.drawImage(
      image,
      Offset(
        padding * 1 + imageSize.width * (1 - 1),
        imageSize.height + padding,
      ),
      _paint,
    );

    _paint.colorFilter = ColorFilter.mode(Colors.red, BlendMode.src);
    canvas.drawImage(
      image,
      Offset(
        padding * 2 + imageSize.width * (2 - 1),
        imageSize.height + padding,
      ),
      _paint,
    );

    _paint.colorFilter = null;
    canvas.drawImage(
      image,
      Offset(
        padding * 3 + imageSize.width * (3 - 1),
        imageSize.height + padding,
      ),
      _paint,
    );
    Paint linePaint = Paint();
    linePaint.color = Colors.green;
    linePaint.blendMode = BlendMode.src;
    linePaint.strokeWidth = 10;
    linePaint.style = PaintingStyle.fill;
    canvas.drawLine(
      Offset(
        padding * 3 + imageSize.width * (3 - 1),
        imageSize.height + padding,
      ),
      Offset(
        padding * 3 + imageSize.width * (4 - 1),
        imageSize.height * 2 + padding * 1,
      ),
      linePaint,
    );
    _paint.colorFilter = null;
    canvas.translate(0, imageSize.height * 2 + padding * 2);
  }

  /// maskFilter
  void _paint4(ui.Canvas canvas, ui.Size size) {
    final double rectSize = 40;

    _paint.color = Colors.red;

    _paint.maskFilter = MaskFilter.blur(BlurStyle.solid, 20);
    canvas.drawRect(
      Rect.fromLTWH(padding, rectSize, rectSize, rectSize),
      _paint,
    );

    // 透明
    _paint.maskFilter = MaskFilter.blur(BlurStyle.outer, 20);
    canvas.drawRect(
      Rect.fromLTWH(padding + rectSize * 2, rectSize, rectSize, rectSize),
      _paint,
    );

    _paint.maskFilter = MaskFilter.blur(BlurStyle.inner, 20);
    canvas.drawRect(
      Rect.fromLTWH(
        padding * 2 + rectSize * 4,
        rectSize,
        rectSize,
        rectSize,
      ),
      _paint,
    );
    _paint.maskFilter = null;
    canvas.translate(0, rectSize * 3 + padding * 2);
  }

  /// imageFilter、filterQuality
  void _paint5(ui.Canvas canvas, ui.Size size) {
    _paint.imageFilter = ui.ImageFilter.blur(sigmaX: 0.93, sigmaY: 0.9);
    _paint.filterQuality = FilterQuality.high;
    canvas.drawImage(
      image,
      Offset((size.width - imageSize.width) / 2, 0),
      _paint,
    );
    _paint.imageFilter = null;
    canvas.translate(0, imageSize.width + padding * 2);
  }

  /// shader
  void _paint6(ui.Canvas canvas, ui.Size size) {
    final double rectWidth = 60;
    final double rectHeight = 120;
    _paint.shader = ui.Gradient.linear(
      Offset(0, 0),
      Offset(rectWidth / 10, rectHeight / 10),
      <Color>[Colors.green, Colors.red],
      [0.4, 0.6],
      TileMode.mirror,
    );
    canvas.drawRect(
      Rect.fromLTWH(
        padding * 1 + rectWidth * (1 - 1),
        0,
        rectWidth,
        rectHeight,
      ),
      _paint,
    );

    _paint.shader = ui.Gradient.linear(
      Offset(rectWidth / 2, rectHeight / 2),
      Offset(rectWidth, rectHeight),
      <Color>[Colors.green, Colors.red],
      [0, 1],
      TileMode.clamp,
    );
    canvas.drawRect(
      Rect.fromLTWH(
        padding * 2 + rectWidth * (2 - 1),
        0,
        rectWidth,
        rectHeight,
      ),
      _paint,
    );

    _paint.shader = ui.Gradient.linear(
      Offset(10, 10),
      Offset(20, 20),
      <Color>[Colors.green, Colors.red],
      [0, 1],
      TileMode.repeated,
    );
    canvas.drawRect(
      Rect.fromLTWH(
        padding * 3 + rectWidth * (3 - 1),
        0,
        rectWidth,
        rectHeight,
      ),
      _paint,
    );

    _paint.shader = ui.Gradient.radial(
      Offset(padding + 60, padding * 2 + rectHeight + 60),
      20,
      <Color>[Colors.green, Colors.red],
      [0, 1],
      TileMode.repeated,
    );
    canvas.drawRect(
      Rect.fromLTWH(padding, padding + rectHeight, 120, 120),
      _paint,
    );

    _paint.shader = ui.Gradient.sweep(
      Offset(padding * 2 + 120 + 60, padding * 2 + rectHeight + 60),
      <Color>[Colors.green, Colors.red],
      [0, 1],
      TileMode.clamp,
      0,
      pi * 2,
      null,
    );
    canvas.drawRect(
      Rect.fromLTWH(padding * 2 + 120, padding + rectHeight, 120, 120),
      _paint,
    );

    _paint.shader = null;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
