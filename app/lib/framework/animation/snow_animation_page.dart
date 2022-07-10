import 'dart:math';

import 'package:flutter/material.dart';

class SnowAnimationPage extends StatefulWidget {
  const SnowAnimationPage({Key? key}) : super(key: key);

  @override
  State<SnowAnimationPage> createState() => _SnowAnimationPageState();
}

class _SnowAnimationPageState extends State<SnowAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<_Snowflake> _snowflakes = List.generate(100, (index) => _Snowflake());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SnowAnimation')),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.blue, Colors.lightBlue, Colors.white],
              stops: <double>[0.0, 0.7, 0.95],
            ),
          ),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              _snowflakes.forEach((_Snowflake snow) => snow.fall());
              return CustomPaint(painter: _MyPainter(_snowflakes));
            },
          ),
        ),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  _MyPainter(this._snowflakes);

  List<_Snowflake> _snowflakes;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.white;
    canvas.drawCircle(size.center(Offset(0, 160)), 60, paint);
    canvas.drawOval(
      Rect.fromCenter(
        center: size.center(Offset(0, 320)),
        width: 200,
        height: 250,
      ),
      paint,
    );
    _snowflakes.forEach((_Snowflake snowflake) {
      canvas.drawCircle(
        Offset(snowflake.x, snowflake.y),
        snowflake.radius,
        paint,
      );
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _Snowflake {
  _Snowflake();

  double x = Random().nextDouble() * 400;
  double y = Random().nextDouble() * 800;
  double radius = Random().nextDouble() * 2 + 2;
  double velocity = Random().nextDouble() * 4 + 2;

  void fall() {
    y += velocity;
    if (y > 800) {
      y = 0;

      x = Random().nextDouble() * 400;
      radius = Random().nextDouble() * 2 + 2;
      velocity = Random().nextDouble() * 4 + 2;
    }
  }
}
