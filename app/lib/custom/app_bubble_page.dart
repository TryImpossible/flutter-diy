import 'package:flutter/material.dart';

class AppBubblePage extends StatelessWidget {
  const AppBubblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppBubble控件')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBubble.text(
              '顶部中间箭头',
              direction: AppBubbleDirection.topStart,
              arrowSize: const Size(8, 8),
            ),
            SizedBox(height: 16),
            AppBubble.text('底部箭头', direction: AppBubbleDirection.bottomCenter),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBubble.text('左箭头', direction: AppBubbleDirection.leftCenter),
                SizedBox(width: 16),
                AppBubble.text(
                  '右箭头',
                  direction: AppBubbleDirection.rightCenter,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 气泡方向
enum AppBubbleDirection {
  topStart,
  topCenter,
  topEnd,
  rightStart,
  rightCenter,
  rightEnd,
  bottomEnd,
  bottomCenter,
  bottomStart,
  leftEnd,
  leftCenter,
  leftStart,
}

/// 气泡组件
class AppBubble extends StatelessWidget {
  const AppBubble({
    super.key,
    this.direction = AppBubbleDirection.topCenter,
    this.arrowSize = const Size(16, 8),
    this.arrowRadius = 2,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.margin,
    this.width,
    this.height,
    this.constraints,
    this.color = Colors.blueAccent,
    this.border,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    required this.child,
  });

  AppBubble.text(
    String text, {
    super.key,
    this.direction = AppBubbleDirection.topCenter,
    this.arrowSize = const Size(16, 8),
    this.arrowRadius = 2,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.margin,
    this.width,
    this.height,
    this.constraints,
    this.color = Colors.blueAccent,
    this.border,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    double textFontSize = 14,
    Color textColor = Colors.white,
    FontWeight textFontWeight = FontWeight.normal,
    TextStyle? textStyle,
  }) : child = Text(
         text,
         style:
             textStyle ??
             TextStyle(
               fontSize: textFontSize,
               color: textColor,
               fontWeight: textFontWeight,
               height: 1.2,
             ),
       );

  final AppBubbleDirection direction;
  final Size arrowSize;
  final double arrowRadius;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final Color color;
  final Border? border;
  final BorderRadius borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      constraints: constraints,
      decoration: AppBubbleDecoration(
        boxDecoration: BoxDecoration(
          color: color,
          border: border,
          borderRadius: borderRadius,
        ),
        arrowSize: arrowSize,
        arrowRadius: arrowRadius,
        direction: direction,
      ),
      child: child,
    );
  }
}

/// 气泡装饰
class AppBubbleDecoration extends Decoration {
  final BoxDecoration boxDecoration;
  final AppBubbleDirection direction;
  final Size arrowSize;
  final double arrowRadius;
  final double arrowOffset;

  const AppBubbleDecoration({
    required this.boxDecoration,
    this.direction = AppBubbleDirection.topCenter,
    this.arrowSize = const Size(16, 8),
    this.arrowRadius = 2,
    this.arrowOffset = 0,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    final basePainter = boxDecoration.createBoxPainter(onChanged);
    return _AppBubblePainter(basePainter: basePainter, decoration: this);
  }
}

class _AppBubblePainter extends BoxPainter {
  final BoxPainter basePainter;
  final AppBubbleDecoration decoration;

  _AppBubblePainter({required this.basePainter, required this.decoration});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final size = configuration.size ?? Size.zero;
    final rect = offset & size;

    // 绘制 BoxDecoration 主体
    basePainter.paint(canvas, offset, configuration);

    // 绘制箭头
    _paintArrow(canvas, rect);
  }

  void _paintArrow(Canvas canvas, Rect rect) {
    final arrowSize = decoration.arrowSize;
    final radius = decoration.arrowRadius;
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = decoration.boxDecoration.color ?? Colors.white;

    final path = Path();
    Offset start;
    Offset mid;
    Offset end;

    switch (decoration.direction) {
      // ========== 上方 ==========
      case AppBubbleDirection.topCenter:
        start = Offset(rect.center.dx - arrowSize.width / 2, rect.top);
        mid = Offset(rect.center.dx, rect.top - arrowSize.height);
        end = Offset(rect.center.dx + arrowSize.width / 2, rect.top);
        break;
      case AppBubbleDirection.topStart:
        start = Offset(rect.left + 16, rect.top);
        mid = Offset(
          rect.left + 16 + arrowSize.width / 2,
          rect.top - arrowSize.height,
        );
        end = Offset(rect.left + 16 + arrowSize.width, rect.top);
        break;
      case AppBubbleDirection.topEnd:
        start = Offset(rect.right - 16 - arrowSize.width, rect.top);
        mid = Offset(
          rect.right - 16 - arrowSize.width / 2,
          rect.top - arrowSize.height,
        );
        end = Offset(rect.right - 16, rect.top);
        break;

      // ========== 下方 ==========
      case AppBubbleDirection.bottomCenter:
        start = Offset(rect.center.dx - arrowSize.width / 2, rect.bottom);
        mid = Offset(rect.center.dx, rect.bottom + arrowSize.height);
        end = Offset(rect.center.dx + arrowSize.width / 2, rect.bottom);
        break;
      case AppBubbleDirection.bottomStart:
        start = Offset(rect.left + 16, rect.bottom);
        mid = Offset(
          rect.left + 16 + arrowSize.width / 2,
          rect.bottom + arrowSize.height,
        );
        end = Offset(rect.left + 16 + arrowSize.width, rect.bottom);
        break;
      case AppBubbleDirection.bottomEnd:
        start = Offset(rect.right - 16 - arrowSize.width, rect.bottom);
        mid = Offset(
          rect.right - 16 - arrowSize.width / 2,
          rect.bottom + arrowSize.height,
        );
        end = Offset(rect.right - 16, rect.bottom);
        break;

      // ========== 左侧 ==========
      case AppBubbleDirection.leftCenter:
        start = Offset(rect.left, rect.center.dy - arrowSize.width / 2);
        mid = Offset(rect.left - arrowSize.height, rect.center.dy);
        end = Offset(rect.left, rect.center.dy + arrowSize.width / 2);
        break;
      case AppBubbleDirection.leftStart:
        start = Offset(rect.left, rect.top + 16);
        mid = Offset(
          rect.left - arrowSize.height,
          rect.top + 16 + arrowSize.width / 2,
        );
        end = Offset(rect.left, rect.top + 16 + arrowSize.width);
        break;
      case AppBubbleDirection.leftEnd:
        start = Offset(rect.left, rect.bottom - 16 - arrowSize.width);
        mid = Offset(
          rect.left - arrowSize.height,
          rect.bottom - 16 - arrowSize.width / 2,
        );
        end = Offset(rect.left, rect.bottom - 16);
        break;

      // ========== 右侧 ==========
      case AppBubbleDirection.rightCenter:
        start = Offset(rect.right, rect.center.dy - arrowSize.width / 2);
        mid = Offset(rect.right + arrowSize.height, rect.center.dy);
        end = Offset(rect.right, rect.center.dy + arrowSize.width / 2);
        break;
      case AppBubbleDirection.rightStart:
        start = Offset(rect.right, rect.top + 16);
        mid = Offset(
          rect.right + arrowSize.height,
          rect.top + 16 + arrowSize.width / 2,
        );
        end = Offset(rect.right, rect.top + 16 + arrowSize.width);
        break;
      case AppBubbleDirection.rightEnd:
        start = Offset(rect.right, rect.bottom - 16 - arrowSize.width);
        mid = Offset(
          rect.right + arrowSize.height,
          rect.bottom - 16 - arrowSize.width / 2,
        );
        end = Offset(rect.right, rect.bottom - 16);
        break;
    }

    // 箭头路径 + 圆角
    path.moveTo(start.dx, start.dy);
    if (radius > 0) {
      path.quadraticBezierTo(mid.dx, mid.dy, end.dx, end.dy);
    } else {
      path.lineTo(mid.dx, mid.dy);
      path.lineTo(end.dx, end.dy);
    }
    path.close();

    canvas.drawPath(path, paint);
  }
}
