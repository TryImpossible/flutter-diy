import 'package:flutter/material.dart';

class WaterWavesPage extends StatelessWidget {
  const WaterWavesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('WaterWaves')),
      body: TweenAnimationBuilder(
        duration: const Duration(seconds: 3),
        // curve: Curves.easeInOutQuint,
        tween: Tween<double>(begin: 0, end: 1),
        builder: (_, double value, Widget? child) {
          return CustomPaint(
            key: UniqueKey(),
            painter: _MyPainter(value),
            size: size,
          );
        },
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  final double dy;

  const _MyPainter(this.dy);

  @override
  void paint(Canvas canvas, Size size) {
    double height = 100;

    canvas.translate(0, size.height * (1 - dy));

    Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, height);
    path.cubicTo(
      size.width / 3,
      height * 2 * dy,
      size.width / 3 * 2,
      height * 0 * dy,
      size.width,
      height * 1 * dy,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate != this;
}
