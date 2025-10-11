import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ImageTabIndicatorPage extends StatelessWidget {
  const ImageTabIndicatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 在绘制之前预加载图片
    precacheImage(
      NetworkImage(
        'https://ww1.sinaimg.cn/mw690/007YXBV5ly1hpzb9r88mqj30sg0sg75d.jpg',
      ),
      context,
    );
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ImageTabIndicator'),
          bottom: TabBar(
            indicator: _ImageTabIndicator(
              // provider: AssetImage('assets/images/indicator.png'),
              // width: 30,
              // height: 10,
              provider: NetworkImage(
                'https://ww1.sinaimg.cn/mw690/007YXBV5ly1hpzb9r88mqj30sg0sg75d.jpg',
              ),
              width: 50,
              height: 50,
            ),
            tabs: <Widget>[
              Tab(icon: Icon(Icons.home), text: '首页'),
              Tab(icon: Icon(Icons.category), text: '分类'),
              Tab(icon: Icon(Icons.person), text: '我的'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(child: Text('首页内容')),
            Center(child: Text('分类内容')),
            Center(child: Text('我的内容')),
          ],
        ),
      ),
    );
  }
}

class _ImageTabIndicator extends Decoration {
  const _ImageTabIndicator({
    required this.provider,
    required this.width,
    required this.height,
  });

  final ImageProvider provider;
  final double width;
  final double height;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _ImageTabIndicatorPainter(this, onChanged);
  }
}

class _ImageTabIndicatorPainter extends BoxPainter {
  _ImageTabIndicatorPainter(this.decoration, VoidCallback? onChanged)
    : super(onChanged) {
    _imageStreamListener = ImageStreamListener(
      _handleImage,
      onError: _handleError,
    );
  }

  final _ImageTabIndicator decoration;

  ImageStream? _imageStream;
  ImageInfo? _imageInfo;
  late final ImageStreamListener _imageStreamListener;

  void _resolve(ImageConfiguration configuration) {
    final ImageStream newStream = decoration.provider.resolve(configuration);
    if (_imageStream?.key == newStream.key) {
      return;
    }
    _imageStream?.removeListener(_imageStreamListener);
    _imageStream = newStream;
    _imageStream!.addListener(_imageStreamListener);
  }

  void _handleImage(ImageInfo info, bool synchronousCall) {
    _imageInfo?.dispose();
    _imageInfo = info;
    onChanged?.call(); // 通知上层重绘
  }

  void _handleError(Object exception, StackTrace? stackTrace) {
    // 处理错误（可选）
    debugPrint('Error loading tab indicator image: $exception');
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // 确保开始加载（或已通过上次调用开始）
    _resolve(configuration);

    final Size? size = configuration.size;
    if (size == null) {
      // 按注释应至少有 size，但多一层保护
      return;
    }

    if (_imageInfo == null) {
      // 图片还没准备好，可以绘制占位或什么都不做
      return;
    }

    final ui.Image image = _imageInfo!.image;
    final Rect srcRect = Rect.fromLTWH(
      0,
      0,
      image.width.toDouble(),
      image.height.toDouble(),
    );
    final Rect rect = offset & size;
    // 计算 indicator 的位置，贴近底部
    final indicatorRect = Rect.fromLTWH(
      rect.left + (rect.width - decoration.width) / 2, // 水平居中
      rect.bottom - decoration.height, // 贴近底部
      decoration.width,
      decoration.height,
    );
    final Paint paint = Paint();
    canvas.drawImageRect(image, srcRect, indicatorRect, paint);
  }

  @override
  void dispose() {
    _imageStream?.removeListener(_imageStreamListener);
    _imageStream = null;
    _imageInfo?.dispose();
    _imageInfo = null;
    super.dispose();
  }
}
