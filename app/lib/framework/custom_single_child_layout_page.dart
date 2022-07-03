import 'package:flutter/material.dart';

class CustomSingleChildLayoutPage extends StatelessWidget {
  const CustomSingleChildLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomSingleChildLayout'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.grey.shade500,
          child: _OffsetWidget(
            offset: Offset(-10, -10),
            direction: Direction.bottomLeft,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}

enum Direction {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

class _OffsetWidget extends StatelessWidget {
  const _OffsetWidget({
    Key? key,
    this.offset = Offset.zero,
    this.direction = Direction.topLeft,
    this.child,
  }) : super(key: key);
  final Offset offset;
  final Direction direction;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomSingleChildLayout(
      delegate: _OffsetDelegate(
        offset: offset,
        direction: direction,
      ),
      child: child,
    );
  }
}

class _OffsetDelegate extends SingleChildLayoutDelegate {
  _OffsetDelegate({
    this.offset = Offset.zero,
    this.direction = Direction.topLeft,
  });

  final Offset offset;
  final Direction direction;

  @override
  bool shouldRelayout(covariant _OffsetDelegate oldDelegate) {
    return offset != oldDelegate.offset;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    debugPrint('getSize=> constraints: $constraints');
    return super.getSize(constraints);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    debugPrint('getPositionForChild=> size: $size, childSize: $childSize');
    // return super.getPositionForChild(size, childSize);
    final double w = size.width;
    final double h = size.height;
    final double wc = childSize.width;
    final double hc = childSize.height;

    switch (direction) {
      case Direction.topLeft:
        return offset;
      case Direction.topRight:
        return offset.translate(w - wc - offset.dx * 2, 0);
      case Direction.bottomLeft:
        return offset.translate(0, h - hc - offset.dy * 2);
      case Direction.bottomRight:
        return offset.translate(w - wc - offset.dx * 2, h - hc - offset.dy * 2);
      default:
        return offset;
    }
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    debugPrint('getConstraintsForChild=> constraints: $constraints');
    return super.getConstraintsForChild(constraints);
    // return BoxConstraints(
    //   maxHeight: constraints.maxHeight / 2,
    //   maxWidth: constraints.maxWidth / 2,
    //   minHeight: constraints.maxHeight / 4,
    //   minWidth: constraints.maxWidth / 4,
    // );
  }
}
