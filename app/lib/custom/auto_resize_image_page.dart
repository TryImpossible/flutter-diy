import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const String url =
    "https://raw.githubusercontent.com/BigTimo/auto_resize_image/refs/heads/master/example/assets/aa.jpeg";
const String assetsAa = "assets/images/aa.jpeg";
const String assetsLong = "assets/images/long.jpg";

class AutoResizeImagePage extends StatefulWidget {
  const AutoResizeImagePage({super.key});

  @override
  State<AutoResizeImagePage> createState() => _AutoResizeImagePageState();
}

class _AutoResizeImagePageState extends State<AutoResizeImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AutoResizeImage')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("debugInvertOversizedImages: $debugInvertOversizedImages"),
                Switch(
                  value: debugInvertOversizedImages,
                  onChanged: (value) {
                    setState(() {
                      debugInvertOversizedImages = value;
                    });
                  },
                ),
              ],
            ),
            Wrap(
              children: [
                // _buildImage(
                //   text: 'CachedNetworkImage',
                //   imageProvider: CachedNetworkImageProvider(url),
                // ),
                _buildImage(
                  text: 'NetworkImage',
                  imageProvider: NetworkImage(url),
                ),
                _buildImage(
                  text: 'AssetsImage contain',
                  imageProvider: const AssetImage(assetsAa),
                  resizeMode: ResizeMode.contain,
                ),
                _buildImage(
                  text: 'AssetsImage balance',
                  imageProvider: const AssetImage(assetsAa),
                  resizeMode: ResizeMode.balance,
                ),
                _buildImage(
                  text: 'AssetsImage cover',
                  imageProvider: const AssetImage(assetsAa),
                  resizeMode: ResizeMode.cover,
                ),
                _buildImage(
                  text: 'Long image cover',
                  imageProvider: const AssetImage(assetsLong),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage({
    required String text,
    required ImageProvider imageProvider,
    ResizeMode resizeMode = ResizeMode.balance,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 180,
          height: 180,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Image(
                fit: BoxFit.cover,
                image: AutoResizeImage(
                  resizeMode: resizeMode,
                  imageProvider: imageProvider,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                ),
              );
            },
          ),
        ),
        Text(text),
      ],
    );
  }
}

/// Decoding and caching modes, debugInvertOversizedImages tip see [paintImage]
///
/// 解码和缓存模式，图片过载提示请看[paintImage]
enum ResizeMode {
  /// The maximum width and height of the image are equal to the minimum width and height of the widget,
  /// resulting in lower clarity and avoiding being Oversized.
  ///
  /// 图片宽高的最大值等于widget宽高的最小值，清晰度低，不会Oversized
  ///
  /// ![](https://github.com/BigTimo/auto_resize_image/blob/master/img/contain.jpg?raw=true)
  contain,

  /// The area of the image is equal to the area of the widget, resulting in moderate clarity and avoiding being Oversized.
  ///
  /// 图片面积等于widget面积，清晰度中，不会Oversized
  ///
  /// ![](https://github.com/BigTimo/auto_resize_image/blob/master/img/balance.jpg?raw=true)
  balance,

  /// The minimum width and height of the image are equal to the maximum width and height of the widget,
  /// resulting in higher clarity but potentially causing Oversized issues.
  ///
  /// 图片宽高的最小值等于widget宽高的最大值，清晰度高，会Oversized
  ///
  /// ![](https://github.com/BigTimo/auto_resize_image/blob/master/img/cover.jpg?raw=true)
  cover,
}

class AutoResizeImage extends ImageProvider<AutoResizeImageKey> {
  /// Decode and cache images based on the width and height of the widget.
  /// The image will lose detail and use less memory if resized to a size smaller than the native size.
  ///
  /// 根据 widget 的宽度和高度解码并缓存图片。
  /// 如果调整大小为小于原始尺寸的尺寸，图片将丢失细节并使用更少的内存。
  const AutoResizeImage({
    required this.imageProvider,
    required this.width,
    required this.height,
    this.resizeMode = ResizeMode.balance,
    this.overRatio = 2,
    this.scale = 1,
  });

  /// The [ImageProvider] that this class wraps.
  final ImageProvider imageProvider;

  /// The width of the widget controls image decode and cache.
  ///
  /// 控件的宽度，控制图片解码和缓存
  final double width;

  /// The height of the widget controls image decode and cache.
  ///
  /// 控件的高度，控制图片解码和缓存
  final double height;

  /// Decoding and caching modes
  ///
  /// 解码和缓存模式
  final ResizeMode resizeMode;

  ///If the aspect ratio of the image is greater than that of the widget, it will default to [ResizeMode.cover] to ensure clarity.
  ///
  /// 如果图片的宽高比/widget的宽高比大于这个值，将会默认使用[ResizeMode.cover]，保证清晰度
  final double overRatio;

  /// Scaling and adjusting image clarity while simultaneously adjusting the cache memory accordingly.
  ///
  /// 缩放，调整图片清晰度，同时缓存内存也会对应调整
  final double scale;

  @override
  Future<AutoResizeImageKey> obtainKey(ImageConfiguration configuration) {
    double devicePixelRatio = configuration.devicePixelRatio ?? 1.0;
    Completer<AutoResizeImageKey>? completer;
    // If the imageProvider.obtainKey future is synchronous, then we will be able to fill in result with
    // a value before completer is initialized below.
    SynchronousFuture<AutoResizeImageKey>? result;
    imageProvider.obtainKey(configuration).then((Object key) {
      if (completer == null) {
        // This future has completed synchronously (completer was never assigned),
        // so we can directly create the synchronous result to return.
        result = SynchronousFuture<AutoResizeImageKey>(
          AutoResizeImageKey._(
            key,
            width,
            height,
            resizeMode,
            overRatio,
            scale,
            devicePixelRatio,
          ),
        );
      } else {
        // This future did not synchronously complete.
        completer.complete(
          AutoResizeImageKey._(
            key,
            width,
            height,
            resizeMode,
            overRatio,
            scale,
            devicePixelRatio,
          ),
        );
      }
    });
    if (result != null) {
      return result!;
    }
    // If the code reaches here, it means the imageProvider.obtainKey was not
    // completed sync, so we initialize the completer for completion later.
    completer = Completer<AutoResizeImageKey>();
    return completer.future;
  }

  @override
  ImageStreamCompleter loadImage(
    AutoResizeImageKey key,
    ImageDecoderCallback decode,
  ) {
    Future<Codec> decodeResize(
      ImmutableBuffer buffer, {
      TargetImageSizeCallback? getTargetSize,
    }) async {
      assert(
        getTargetSize == null,
        'AutoResizeImage cannot be composed with another ImageProvider '
        'that applies getTargetSize.',
      );
      final ImageDescriptor descriptor = await ImageDescriptor.encoded(buffer);
      Size resize = _resize(descriptor, key._devicePixelRatio);
      return descriptor.instantiateCodec(
        targetWidth: resize.width.round(),
        targetHeight: resize.height.round(),
      );
    }

    final ImageStreamCompleter completer = imageProvider.loadImage(
      key._providerCacheKey,
      decodeResize,
    );
    if (!kReleaseMode) {
      completer.debugLabel =
          '${completer.debugLabel} - Resized(${key._width}×${key._height})';
    }
    _configureErrorListener(completer, key);
    return completer;
  }

  void _configureErrorListener(
    ImageStreamCompleter completer,
    AutoResizeImageKey key,
  ) {
    completer.addEphemeralErrorListener((
      Object exception,
      StackTrace? stackTrace,
    ) {
      // The microtask is scheduled because of the same reason as NetworkImage:
      // Depending on where the exception was thrown, the image cache may not
      // have had a chance to track the key in the cache at all.
      // Schedule a microtask to give the cache a chance to add the key.
      scheduleMicrotask(() {
        PaintingBinding.instance.imageCache.evict(key);
      });
    });
  }

  Size _resize(ImageDescriptor descriptor, double devicePixelRatio) {
    double displayWidth = width * devicePixelRatio;
    double displayHeight = height * devicePixelRatio;
    var displayAspectRatio = displayWidth / displayHeight;

    int imageWidth = descriptor.width;
    int imageHeight = descriptor.height;
    double imageAspectRatio = imageWidth / imageHeight;

    if (displayHeight == double.infinity) {
      displayHeight = displayWidth / imageAspectRatio;
    }
    if (displayWidth == double.infinity) {
      displayWidth = displayHeight * imageAspectRatio;
    }

    double targetWidth;
    double targetHeight;

    if (imageWidth * imageHeight <= displayWidth * displayHeight) {
      targetWidth = imageWidth.toDouble();
      targetHeight = imageHeight.toDouble();
    } else {
      //need resize
      var mode =
          imageAspectRatio / displayAspectRatio > overRatio ||
              (1 / imageAspectRatio) / (1 / displayAspectRatio) > overRatio
          ? ResizeMode.cover
          : resizeMode;
      switch (mode) {
        case ResizeMode.contain:
          if (imageAspectRatio > 1) {
            //wide
            targetWidth = displayWidth;
            targetHeight = displayWidth / imageAspectRatio;
          } else {
            //long
            targetWidth = displayHeight * imageAspectRatio;
            targetHeight = displayHeight;
          }
          break;
        case ResizeMode.cover:
          if (imageAspectRatio > 1) {
            //wide
            targetWidth = displayHeight * imageAspectRatio;
            targetHeight = displayHeight;
          } else {
            //long
            targetWidth = displayWidth;
            targetHeight = displayWidth / imageAspectRatio;
          }
          break;
        case ResizeMode.balance:
          final double factor = sqrt(
            (displayWidth * displayHeight) / (imageWidth * imageHeight),
          );
          targetWidth = imageWidth * factor;
          targetHeight = imageHeight * factor;
          break;
      }
    }
    return Size(targetWidth * scale, targetHeight * scale);
  }
}

/// This is used to identify the precise resource in the [imageCache].
@immutable
class AutoResizeImageKey {
  // Private constructor so nobody from the outside can poison the image cache
  // with this key. It's only accessible to [AutoResizeImage] internally.
  const AutoResizeImageKey._(
    this._providerCacheKey,
    this._width,
    this._height,
    this._resizeMode,
    this._overRatio,
    this._scale,
    this._devicePixelRatio,
  );

  final Object _providerCacheKey;
  final double _width;
  final double _height;
  final ResizeMode _resizeMode;
  final double _overRatio;
  final double _scale;
  final double _devicePixelRatio;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is AutoResizeImageKey &&
        other._providerCacheKey == _providerCacheKey &&
        other._width == _width &&
        other._height == _height &&
        other._resizeMode == _resizeMode &&
        other._scale == _scale &&
        other._overRatio == _overRatio &&
        other._devicePixelRatio == _devicePixelRatio;
  }

  @override
  int get hashCode => Object.hash(
    _providerCacheKey,
    _width,
    _height,
    _resizeMode,
    _overRatio,
    _scale,
    _devicePixelRatio,
  );
}
