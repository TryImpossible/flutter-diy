import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CountdownButtonPage extends StatefulWidget {
  const CountdownButtonPage({super.key});

  @override
  State<CountdownButtonPage> createState() => _CountdownButtonPageState();
}

class _CountdownButtonPageState extends State<CountdownButtonPage> {
  bool _zoomed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('倒计时按钮')),
      body: Center(
        child: Transform.scale(
          scale: _zoomed ? 2.0 : 1.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CountdownButton(
                duration: Duration(seconds: 5),
                width: 120,
                height: 40,
                radius: 20,
              ),
              SizedBox(height: 24),
              CountdownButton(
                duration: Duration(seconds: 60),
                width: 80,
                height: 80,
                radius: 40,
              ),
              SizedBox(height: 24),
              CountdownButton(
                duration: Duration(seconds: 5),
                width: 80,
                height: 50,
                radius: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CountdownButton extends StatefulWidget {
  const CountdownButton({
    super.key,
    required this.duration,
    required this.width,
    required this.height,
    required this.radius,
  });

  final Duration duration;
  final double width;
  final double height;
  final double radius;

  @override
  State<CountdownButton> createState() => _CountdownButtonState();
}

class _CountdownButtonState extends State<CountdownButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: widget.duration)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            setState(() {
              _stage = 2;
            });
          }
        });

  int _stage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late String label;
    Color? textColor;
    Color? bgColor;
    switch (_stage) {
      case 0:
        label = 'Send';
        textColor = Colors.white;
        bgColor = Colors.blue;
        break;
      case 1:
        label = 'Cancel';
        break;
      case 2:
        label = 'Done';
        textColor = Colors.grey;
        break;
    }
    return CustomPaint(
      // painter: BorderPainter(
      //   buttonWidth: widget.width,
      //   buttonHeight: widget.height,
      //   buttonRadius: widget.radius,
      //   animation: _controller,
      // ),
      painter: CountdownButtonPainter(
        borderWidth: 2,
        borderColor: Colors.grey,
        color: Colors.blue,
        radius: widget.radius,
        animation: _controller,
      ),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: TextButton(
          onPressed: () {
            print('123');
            if (_stage == 0) {
              _controller.forward(from: 0);
              setState(() {
                _stage = 1;
              });
            } else {
              _controller.reset();
              setState(() {
                _stage = 0;
              });
            }
          },
          style: TextButton.styleFrom(
            foregroundColor: textColor,
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.radius),
            ),
          ),
          child: Text(label),
        ),
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  BorderPainter({
    required this.buttonWidth,
    required this.buttonHeight,
    required this.buttonRadius,
    required this.animation,
  }) : super(repaint: animation) {
    shape = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset.zero,
        width: buttonWidth,
        height: buttonHeight,
      ),
      Radius.circular(buttonRadius),
    );
    final Path path = Path()..addRRect(shape);
    pathMetric = path.computeMetrics().single;
    print('path metric: $pathMetric');
  }

  final double buttonWidth;
  final double buttonHeight;
  final double buttonRadius;
  final Animation<double> animation;

  final Paint bluePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0
    ..color = Colors.blue;

  final Paint greyPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0
    ..color = Colors.grey;

  late RRect shape;
  late PathMetric pathMetric;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();
    final double totalLength = pathMetric.length;
    final double currentLength = totalLength * animation.value;

    // path.addPath(pathMetric.extractPath(0, currentLength), Offset.zero);
    final double startingPoint =
        totalLength / 4 + max(buttonHeight / 2 - buttonRadius, 0);

    path.addPath(
      pathMetric.extractPath(startingPoint, currentLength + startingPoint),
      Offset.zero,
    );

    path.addPath(
      pathMetric.extractPath(
        0.0,
        currentLength - (totalLength - startingPoint),
      ),
      Offset.zero,
    );

    canvas.translate(buttonWidth / 2, buttonHeight / 2);

    canvas.drawRRect(shape, bluePaint);
    canvas.drawPath(path, greyPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CountdownButtonPainter extends CustomPainter {
  const CountdownButtonPainter({
    required this.borderWidth,
    required this.borderColor,
    required this.color,
    this.radius,
    required this.animation,
  }) : super(repaint: animation);

  final double borderWidth;
  final Color borderColor;
  final Color color;
  final double? radius;
  final Animation<double> animation;

  double get _radius => radius ?? 0;

  Radius get _circularRadius => Radius.circular(_radius);

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final RRect rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(_radius),
    );

    final Path path = Path()
      ..moveTo(width / 2, 0)
      ..relativeLineTo(width / 2 - _radius, 0)
      ..relativeArcToPoint(Offset(_radius, _radius), radius: _circularRadius)
      ..relativeLineTo(0, height - _radius * 2)
      ..relativeArcToPoint(Offset(-_radius, _radius), radius: _circularRadius)
      ..relativeLineTo(-width + _radius * 2, 0)
      ..relativeArcToPoint(Offset(-_radius, -_radius), radius: _circularRadius)
      ..relativeLineTo(0, -height + _radius * 2)
      ..relativeArcToPoint(Offset(_radius, -_radius), radius: _circularRadius)
      ..relativeLineTo(width / 2 - _radius, 0)
      ..close();

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawPath(path, paint..color = color);
    if (animation.value == 0) {
      canvas.drawRRect(
        rRect,
        Paint()
          ..style = PaintingStyle.fill
          ..color = color,
      );
      return;
    }

    final PathMetrics metrics = path.computeMetrics();
    for (final PathMetric metric in metrics) {
      canvas.drawPath(
        metric.extractPath(0, metric.length * animation.value),
        paint..color = borderColor,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
