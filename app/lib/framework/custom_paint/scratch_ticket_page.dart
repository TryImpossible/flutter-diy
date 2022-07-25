import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScratchTicketPage extends StatefulWidget {
  const ScratchTicketPage({Key? key}) : super(key: key);

  @override
  State<ScratchTicketPage> createState() => _ScratchTicketPageState();
}

class _ScratchTicketPageState extends State<ScratchTicketPage> {
  final List<String> _allImagePath = <String>[
    'assets/images/lufei.jpeg',
    'assets/images/suolong.jpeg',
    'assets/images/shanzhi.jpeg',
    'assets/images/aisi.jpeg',
    'assets/images/luo.jpeg',
  ];
  String _imagePath = 'assets/images/lufei.jpeg';

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
    final Size size = Size.square(MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(title: const Text('ScratchTicket')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                '在灰色区域滑动即可刮出惊喜',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox.fromSize(
              size: size,
              child: FutureBuilder<ui.Image>(
                future: _loadAssetImage(_imagePath, size),
                builder:
                    (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    Path path = Path();
                    // 请求已结束
                    return StatefulBuilder(builder: (_, StateSetter setState) {
                      return GestureDetector(
                        onPanUpdate: (DragUpdateDetails update) {
                          path.lineTo(
                            update.localPosition.dx,
                            update.localPosition.dy,
                          );
                          setState(() {});
                        },
                        onPanDown: (DragDownDetails down) {
                          path.moveTo(
                            down.localPosition.dx,
                            down.localPosition.dy,
                          );
                        },
                        child: CustomPaint(
                          painter: _MyPainter(
                            image: snapshot.data!,
                            path: path,
                          ),
                          size: size,
                        ),
                      );
                    });
                  } else {
                    // 请求未结束，显示loadign
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _imagePath =
                    _allImagePath[Random().nextInt(_allImagePath.length - 1)];
                setState(() {});
              },
              child: const Text('再刮一次'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  const _MyPainter({
    required this.image,
    required this.path,
  });

  final ui.Image image;
  final Path path;

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    /// 绘制奖票图片
    canvas.drawImage(image, Offset.zero, Paint());

    /// 保存新的图层
    canvas.saveLayer(null, Paint());

    /// 绘制灰色区域
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = Colors.grey,
    );

    /// 绘制透明区域，使用BlendMode.src实现，手指滑过的区域只显示透明，不显示灰色
    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 30;
    paint.blendMode = BlendMode.src;
    paint.color = Colors.transparent;
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
