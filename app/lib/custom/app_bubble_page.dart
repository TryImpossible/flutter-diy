import 'package:flutter/material.dart';

class AppBubblePage extends StatelessWidget {
  const AppBubblePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBubble控件'),
      ),
      body: Center(
        child: AppBubble(),
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

class AppBubble extends StatelessWidget {
  AppBubble({
    Key? key,
    this.direction = AppBubbleDirection.topCenter,
    this.arrowSize = const Size(16, 8),
    this.arrowRadius = 2,
    this.alignment,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.margin,
    this.width,
    this.height,
    this.constraints,
    this.color = Colors.blueAccent,
    this.border,
    BorderRadius? borderRadius,
    this.child,
  })  : borderRadius = borderRadius ?? BorderRadius.circular(4),
        super(key: key);

  AppBubble.text(
    String text, {
    Key? key,
    this.direction = AppBubbleDirection.topCenter,
    this.arrowSize = const Size(16, 8),
    this.arrowRadius = 2,
    this.alignment,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.margin,
    this.width,
    this.height,
    this.constraints,
    this.color = Colors.blueAccent,
    this.border,
    BorderRadius? borderRadius,
    double textFontSize = 14,
    Color textColor = Colors.white,
    FontWeight textFontWeight = FontWeight.normal,
    TextStyle? textStyle,
  })  : borderRadius = borderRadius ?? BorderRadius.circular(4),
        child = Text(
          text,
          style: textStyle ??
              TextStyle(
                height: 1.2,
                fontSize: textFontSize,
                color: textColor,
                fontWeight: textFontWeight,
              ),
        ),
        super(key: key);

  final AppBubbleDirection direction;
  final Size arrowSize;
  final double arrowRadius;
  final Alignment? alignment;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final Color? color;
  final Border? border;
  final BorderRadius? borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _BubblePath(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
        color: Colors.blueAccent,
        // decoration: BoxDecoration(
        //   color: Colors.blueAccent,
        //   borderRadius: BorderRadius.circular(8),
        // ),
        child: const Text(
          '我是内容我是内容我是内容我是内容我是内容',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class _BubblePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 8, size.width, size.height - 8),
        const Radius.circular(12),
      ),
    );
    path.addPath(
      Path()
        ..moveTo(4, 0)
        ..lineTo(0, 8)
        ..lineTo(8, 8),
      Offset(size.width / 2, 0),
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
