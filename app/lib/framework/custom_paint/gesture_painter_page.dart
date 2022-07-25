import 'dart:ui';

import 'package:flutter/material.dart';

class GesturePainterPage extends StatefulWidget {
  const GesturePainterPage({Key? key}) : super(key: key);

  @override
  State<GesturePainterPage> createState() => _GesturePainterPageState();
}

class _GesturePainterPageState extends State<GesturePainterPage>
    with SingleTickerProviderStateMixin {
  late ValueNotifier<Offset> _valueNotifier;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier(Offset.zero);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('GesturePainter'),
      ),
      body: Center(
        child: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            _valueNotifier.value = details.localPosition;
          },
          child: ColoredBox(
            color: Colors.grey.shade300,
            child: CustomPaint(
              painter: _MyPainter(_valueNotifier),
              size: Size.square(size.width),
            ),
          ),
        ),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  _MyPainter(this.value) : super(repaint: value);
  ValueNotifier<Offset> value;

  @override
  void paint(Canvas canvas, Size size) {
    print(value.value);
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke;
    canvas.drawPoints(PointMode.points, [value.value], paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
