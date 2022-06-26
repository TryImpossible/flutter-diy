import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef ImageSizeResolve = void Function(Size size);

class ImageSizeProxyWidget extends SingleChildRenderObjectWidget {
  const ImageSizeProxyWidget({
    Key? key,
    Widget? child,
    required this.onResolve,
  }) : super(key: key, child: child);
  final ImageSizeResolve onResolve;

  @override
  ImageSizeProxyElement createElement() => ImageSizeProxyElement(this);

  @override
  ImageSizeRenderBox createRenderObject(BuildContext context) =>
      ImageSizeRenderBox(onResolve);

  @override
  void updateRenderObject(
      BuildContext context, covariant ImageSizeRenderBox renderObject) {
    super.updateRenderObject(context, renderObject);
    renderObject.onResolve = onResolve;
  }
}

class ImageSizeProxyElement extends SingleChildRenderObjectElement {
  ImageSizeProxyElement(SingleChildRenderObjectWidget widget) : super(widget);
}

class ImageSizeRenderBox extends RenderProxyBox with RenderProxyBoxMixin {
  ImageSizeRenderBox(ImageSizeResolve onResolve, [RenderBox? child])
      : onResolve = onResolve,
        super(child);
  ImageSizeResolve onResolve;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (hasSize) {
      onResolve(size);
    }
    super.paint(context, offset);
  }
}
