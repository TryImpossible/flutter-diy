import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedPathPage extends StatefulWidget {
  const AnimatedPathPage({Key? key}) : super(key: key);

  @override
  State<AnimatedPathPage> createState() => _AnimatedPathPageState();
}

class _AnimatedPathPageState extends State<AnimatedPathPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedPath')),
      body: Center(
        child: ColoredBox(
          color: Colors.grey.shade300,
          child: CustomPaint(
            painter: _AnimatedPathPainter(_controller),
            size: Size.square(size.width),
          ),
        ),
      ),
    );
  }
}

/// 点的移动和线的绘制
class _AnimatedPathPainter extends CustomPainter {
  _AnimatedPathPainter(this.animation) : super(repaint: animation);

  final Animation<double> animation;

  /// 将角度转为极坐标
  double _calY(double x) {
    return 50 * (pow(e, cos(x)) - 2 * cos(4 * x)) + pow(sin(x / 12), 5); //第二处
  }

  /// 将角度值转为弧度制
  double _convert(int x) {
    return pi / 180 * x;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red
      ..strokeWidth = 3;

    /// 第一处：将角度值转为弧度制，因为极坐标是在角度的世界绘制的，所以需要先转换。
    /// 第二处：将角度转为极坐标的 ρ 值，注意一下，这里给原图像夸大了 50 倍，是为了让图像更大。
    /// 第三处：将极坐标转为了直角坐标，并添加到了坐标点集合中。注意一下，这里是从 0-360 度每个度数都添加一个坐标。
    List<Offset> points = [];
    for (int i = 0; i < 360; i++) {
      double thta = _convert(i); //第一处
      double p = _calY(thta); //第二处
      points.add(Offset(p * cos(thta), p * sin(thta))); //第三处
    }

    // 坐标点方式
    // canvas.drawPoints(PointMode.points, points, paint);

    Path path = Path();

    /// 直线方式
    // for (int i = 1; i < points.length; i++) {
    //   path.lineTo(points[i].dx, points[i].dy);
    // }

    /// 曲线方式
    /// 目标点是曲线上的每一个点
    /// 控制点是前一个目标点和后一个目标点的中间点
    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      double controllerX = (points[i].dx + points[i - 1].dx) / 2;
      double controllerY = (points[i].dy + points[i - 1].dy) / 2;

      path.quadraticBezierTo(
        controllerX,
        controllerY,
        points[i].dx,
        points[i].dy,
      );
    }

    PathMetrics metrics = path.computeMetrics();
    for (var element in metrics) {
      /// 第一处的计算如下：
      /// animation.value 是动画的度量，比如进度 50%
      /// element.length 是路径的长度，比如总长度是 100
      /// 那么提取的路径是 0 到 50
      /// 第二处就是直接把子路径绘制下来
      Path path = element.extractPath(
        0,
        element.length * animation.value,
      ); //第一处
      canvas.drawPath(path, paint); //第二处

      /// 第一处就是拿到了动画进度下的正切点
      /// 第二处的 position 就是实际的坐标点
      Tangent? tangent = element.getTangentForOffset(
        element.length * animation.value,
      ); //第一处
      if (tangent != null) {
        paint.style = PaintingStyle.fill;
        paint.color = Colors.blue;
        canvas.drawCircle(tangent.position, 3, paint); //第二处
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
