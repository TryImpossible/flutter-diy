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
  _ImageSizeProxyElement createElement() => _ImageSizeProxyElement(this);

  @override
  _RenderImageSizeProxy createRenderObject(BuildContext context) =>
      _RenderImageSizeProxy(onResolve);

  @override
  void updateRenderObject(
      BuildContext context, covariant _RenderImageSizeProxy renderObject) {
    super.updateRenderObject(context, renderObject);
    renderObject.onResolve = onResolve;
  }
}

class _ImageSizeProxyElement extends SingleChildRenderObjectElement {
  _ImageSizeProxyElement(SingleChildRenderObjectWidget widget) : super(widget);
}

class _RenderImageSizeProxy extends RenderProxyBox with RenderProxyBoxMixin {
  _RenderImageSizeProxy(ImageSizeResolve onResolve, [RenderBox? child])
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
