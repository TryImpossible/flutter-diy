import 'package:flutter/material.dart';

class LineChartPage extends StatelessWidget {
  const LineChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('LineChart')),
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
      ..color = Colors.red.shade300
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawLine(const Offset(10, 10), Offset(10, size.height - 10), paint);
    canvas.drawLine(
      Offset(10, size.height - 10),
      Offset(size.width - 10, size.height - 10),
      paint,
    );

    Path path = Path();
    path.moveTo(20, size.height - 10);
    path.lineTo(40, size.height - 120);
    path.lineTo(80, size.height - 60);
    path.lineTo(220, 180);
    path.lineTo(300, 280);
    // path.close();

    canvas.drawPath(path, paint..color = Colors.green);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
