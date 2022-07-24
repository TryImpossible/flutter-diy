import 'package:flutter/material.dart';

class SaveRestorePage extends StatelessWidget {
  const SaveRestorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('SaveRestore')),
      body: Center(
        child: ColoredBox(
          color: Colors.grey.shade300,
          child: CustomPaint(
            painter: _MyPainter(),
            size: Size.square(size.width),
          ),
        ),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.clipRRect(RRect.fromRectXY(Offset.zero & (size / 2.0), 30.0, 30.0));

    /// 以下两种写法相等
    // canvas.clipRect(Rect.fromCenter(
    //   center: Offset(size.width / 4, size.width / 4),
    //   width: size.width / 2,
    //   height: size.width / 2,
    // ));
    // canvas.clipRect(Offset.zero & (size / 2.0));

    canvas.drawPaint(Paint()..color = Colors.white);
    canvas.restore();

    canvas.save();
    canvas.clipRRect(RRect.fromRectXY(
      size.center(Offset.zero) & (size / 2.0),
      50.0,
      50.0,
    ));
    canvas.drawPaint(Paint()..color = Colors.redAccent);
    canvas.restore();

    canvas.drawLine(
      const Offset(0, 0),
      const Offset(100, 100),
      Paint()..color = Colors.redAccent,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
