import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class AppShadowBox extends SingleChildRenderObjectWidget {
  const AppShadowBox({
    Key? key,
    Widget? child,
    required this.distance,
  }) : super(key: key, child: child);

  final double distance;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderShadowBox(distance);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderObject renderObject,
  ) {
    (renderObject as _RenderShadowBox).distance = distance;
  }
}

class _RenderShadowBox extends RenderBox with RenderObjectWithChildMixin {
  _RenderShadowBox(this.distance);

  double distance;

  @override
  void performLayout() {
    if (child != null) {
      child!.layout(constraints, parentUsesSize: true);
      size = (child as RenderBox).size;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    if (child != null) {
      context.paintChild(child!, offset);
      context.pushOpacity(offset, 127, (context, offset) {
        context.paintChild(child!, offset + Offset(distance, distance));
      });
    }
  }
}
