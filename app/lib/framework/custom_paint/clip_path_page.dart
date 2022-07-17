import 'package:flutter/material.dart';

class ClipPathPage extends StatelessWidget {
  const ClipPathPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('ClipPath')),
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
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(10, 10);
    path.lineTo(50, 10);
    path.close();

    canvas.drawPath(path, paint);

    path = Path();
    path.moveTo(100, 100);
    path.quadraticBezierTo(200, 0, 300, 100); // 二阶贝塞尔，两个点
    canvas.drawPath(path, paint);

    path = Path();
    path.moveTo(0, 200);
    path.cubicTo(100, 300, 200, 100, 300, 200); // 三阶贝塞尔，三个点
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
