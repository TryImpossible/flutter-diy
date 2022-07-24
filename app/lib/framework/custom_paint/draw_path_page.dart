import 'dart:math';

import 'package:flutter/material.dart';

class DrawPathPage extends StatelessWidget {
  const DrawPathPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, CustomPainter> tabs = {
      'PointAndLine': _PointAndLinePainter(),
      'QuadraticBezier': _QuadraticBezierPainter(),
      'Cubic': _CubicPainter(),
      'Shape': _ShapePainter(),
      'Polygon': _PolygonPainter(),
    };
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DrawPath'),
          bottom: TabBar(
            isScrollable: true,
            tabs: tabs.keys.map((String title) {
              return Tab(text: title);
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: tabs.values.map((CustomPainter painter) {
            final Size size = MediaQuery.of(context).size;
            return Center(
              child: ColoredBox(
                color: Colors.grey.shade300,
                child: CustomPaint(
                  painter: painter,
                  size: Size.square(size.width),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

/// 点的移动和线的绘制
class _PointAndLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red
      ..strokeWidth = 3;

    Path path = Path();
    path.lineTo(100, 100);

    path.moveTo(size.width / 2, size.height / 2);
    path.relativeLineTo(100, 100);
    path.relativeLineTo(-100, 100);
    path.relativeLineTo(-100, -100);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// 绘制二阶贝塞尔曲线
class _QuadraticBezierPainter extends CustomPainter {
  /// 以二阶贝塞尔曲线为例，模仿轨迹路径，起始点：P0 ; 控制点：P1 ； 终止点：P2
  /// 连接 P0P1线 和 P1P2 线
  /// 在 P0P1 线上找到点 A，在 P1P2 线上找到点 B，使得 P0A/AP1 = P1B/BP2
  /// 连接 AB，在 AB上找到点 X，X 点满足：AX/XB = P0A/AP1 = P1B/BP2
  /// 找出所有满足公式：AX/XB = P0A/AP1 = P1B/BP2 的X点。（从P0 到 P2 的红色曲线点为所有X点的连线）这条由所有X点组成的连线 即为 贝塞尔曲线。

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red
      ..strokeWidth = 3;

    Path path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(size.width / 2, 0, size.width, size.height);

    path
      ..moveTo(0, size.height)
      ..quadraticBezierTo(size.width / 2, 100, size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// 绘制三阶贝塞尔曲线
class _CubicPainter extends CustomPainter {
  /// 以二阶贝塞尔曲线为例，模仿轨迹路径，起始点：P0 ; 控制点：P1 ； 终止点：P2
  /// 连接 P0P1线 和 P1P2 线
  /// 在 P0P1 线上找到点 A，在 P1P2 线上找到点 B，使得 P0A/AP1 = P1B/BP2
  /// 连接 AB，在 AB上找到点 X，X 点满足：AX/XB = P0A/AP1 = P1B/BP2
  /// 找出所有满足公式：AX/XB = P0A/AP1 = P1B/BP2 的X点。（从P0 到 P2 的红色曲线点为所有X点的连线）这条由所有X点组成的连线 即为 贝塞尔曲线。

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red
      ..strokeWidth = 3;

    // 贝塞尔曲线
    Offset p0 = Offset(0, size.width);
    Offset p1 = const Offset(80, 80);
    Offset p2 = const Offset(180, 120);
    Offset p3 = Offset(size.width, size.width);

    Path path = Path()
      ..moveTo(p0.dx, p0.dy)
      ..cubicTo(p1.dx, p1.dy, p2.dx, p2.dy, p3.dx, p3.dy);
    canvas.drawPath(path, paint);

    // 控制线
    Path linePath = Path()
      ..moveTo(p0.dx, p0.dy)
      ..lineTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..lineTo(p3.dx, p3.dy);
    canvas.drawPath(linePath, paint..color = Colors.grey);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// 绘制形状
class _ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(0, size.height / 2);

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red
      ..strokeWidth = 3;

    Rect rect = Rect.fromPoints(const Offset(100, 100), const Offset(160, 140));
    Path path = Path()
      ..relativeLineTo(100, 100)
      ..addOval(rect) // 绘制椭圆
      ..relativeLineTo(100, -100)
      ..addArc(rect.translate(100 + 60.0, -100), 0, pi) // 绘制180度的圆弧
      ..addRect(rect.translate(100 + 120, -120)) // 绘制矩形
      ..relativeLineTo(-100, -100)
      ..addRRect(RRect.fromRectXY(rect.translate(60, -220), 5, 5)); // 绘制圆角矩形

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// 绘制多边形
class _PolygonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(0, size.height / 2);

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red
      ..strokeWidth = 3;

    Rect rect = Rect.fromPoints(const Offset(100, 100), const Offset(160, 140));

    // 闭合多边形
    Path path = Path();
    path.addPolygon(
      [
        rect.topLeft,
        rect.topRight,
        rect.bottomRight,
        rect.bottomLeft,
      ],
      true,
    );

    // 不闭合多边形

    path.addPolygon(
      [
        rect.topLeft + const Offset(100, 0),
        rect.topRight + const Offset(100, 0),
        rect.bottomRight + const Offset(100, 0),
        rect.bottomLeft + const Offset(100, 0),
      ],
      false,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
