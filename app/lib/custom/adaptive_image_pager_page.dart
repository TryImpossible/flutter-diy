import 'dart:math' as math;

import 'package:flutter/material.dart';

class AdaptiveImagePagerPage extends StatelessWidget {
  const AdaptiveImagePagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = <String>[
      'https://wx4.sinaimg.cn/mw690/9da82ba5gy1hs3pznzc2zj223v35s4qp.jpg',
      'https://c-ssl.dtstatic.com/uploads/blog/202501/11/n6S7ZP6Vs9V5bBE.thumb.1000_0.jpg',
      'https://b0.bdstatic.com/59c199e04dcf4534b8f38e7496569015.jpg@h_1280',
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('AppBubble控件')),
      body: Expanded(
        child: UgCarouselListView(
          initialIndex: 0,
          itemCount: images.length,
          itemBuilder:
              (BuildContext context, int index, UgCarouselLayout layout) {
                final String url = images[index];
                return AspectRatio(
                  aspectRatio: layout.cardWidth / layout.cardHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(width: 1, color: Color(0x0F000000)),
                    ),
                    child: Image.network(url, fit: BoxFit.cover),
                  ),
                );
              },
          carouselLayoutResolver:
              (
                double viewportWidth,
                double viewportHeight,
                Orientation orientation,
              ) {
                final bool isPad = false;
                final _CarouselLayoutConfig config;
                if (!isPad) {
                  config = _CarouselLayoutConfig.mobile();
                } else {
                  config = orientation == Orientation.portrait
                      ? _CarouselLayoutConfig.tabletPortrait()
                      : _CarouselLayoutConfig.tabletLandscape();
                }

                final double ratio = config.aspectRatio;
                final double gap = config.gap;
                final double maxImageHeight = math.max(0.0, viewportHeight);

                final double peekEach = viewportWidth * config.peekFraction;
                final double maxCardWidth = math.max(
                  0.0,
                  viewportWidth - 2 * peekEach,
                );
                double cardHeight = maxImageHeight;
                double cardWidth = cardHeight * ratio;
                if (cardWidth > maxCardWidth) {
                  cardWidth = maxCardWidth;
                  cardHeight = cardWidth / ratio;
                }
                double sideInset = math.min(
                  config.horizontalPadding,
                  (viewportWidth - cardWidth) / 2,
                );
                if (images.length == 1) {
                  sideInset = (viewportWidth - cardWidth) / 2;
                }

                final double stride = images.length <= 1
                    ? cardWidth
                    : cardWidth + gap;
                return UgCarouselLayout(
                  cardWidth: cardWidth,
                  cardHeight: cardHeight,
                  stride: stride,
                  sideInset: math.max(0.0, sideInset),
                );
              },
        ),
      ),
    );
  }
}

class _CarouselLayoutConfig {
  factory _CarouselLayoutConfig.mobile() {
    return _CarouselLayoutConfig(
      designWidth: 295,
      designHeight: 637,
      horizontalPadding: 32,
      peekFraction: 0.08,
      gap: 8,
    );
  }

  factory _CarouselLayoutConfig.tabletPortrait() {
    return _CarouselLayoutConfig(
      designWidth: 552,
      designHeight: 1190,
      horizontalPadding: 36,
      peekFraction: 0.08,
      gap: 16,
    );
  }

  factory _CarouselLayoutConfig.tabletLandscape() {
    return _CarouselLayoutConfig(
      designWidth: 393,
      designHeight: 848,
      horizontalPadding: 36,
      peekFraction: 0.08,
      gap: 16,
    );
  }

  const _CarouselLayoutConfig({
    required this.designWidth,
    required this.designHeight,
    required this.horizontalPadding,
    required this.peekFraction,
    required this.gap,
  });

  final double designWidth;
  final double designHeight;
  final double horizontalPadding;
  final double peekFraction;
  final double gap;

  double get aspectRatio => designWidth / designHeight;
}

typedef UgCarouselLayoutResolver =
    UgCarouselLayout Function(
      double viewportWidth,
      double viewportHeight,
      Orientation orientation,
    );

typedef UgCarouseIndexedWidgetBuilder =
    Widget Function(BuildContext context, int index, UgCarouselLayout layout);

/// 横向轮播 ListView，支持分页吸附和自定义卡片尺寸。
class UgCarouselListView extends StatefulWidget {
  const UgCarouselListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.carouselLayoutResolver,
    this.initialIndex = 0,
    this.onPageChanged,
    this.controller,
  });

  final int itemCount;
  final UgCarouseIndexedWidgetBuilder itemBuilder;
  final UgCarouselLayoutResolver carouselLayoutResolver;
  final int initialIndex;
  final ValueChanged<int>? onPageChanged;

  final ScrollController? controller;

  @override
  State<UgCarouselListView> createState() => _UgCarouselListViewState();
}

class _UgCarouselListViewState extends State<UgCarouselListView> {
  late final ScrollController _scrollController;
  late final ValueNotifier<int> _currentIndexNotifier;

  /// 用于旋转后按旧步长换算当前页。
  double _lastStride = 0;

  /// 是否已根据初始下标完成首次定位。
  bool _hasAppliedInitialOffset = false;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
    _currentIndexNotifier = ValueNotifier<int>(
      widget.initialIndex.clamp(0, math.max(0, widget.itemCount - 1)),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  void _handlePageChanged(int page) {
    if (_currentIndexNotifier.value != page) {
      _currentIndexNotifier.value = page;
      widget.onPageChanged?.call(page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              final Size size = MediaQuery.sizeOf(context);
              final double viewportWidth = size.width;
              final double viewportHeight = size.height;
              final int count = widget.itemCount;
              final UgCarouselLayout layout = widget.carouselLayoutResolver(
                viewportWidth,
                viewportHeight,
                orientation,
              );
              final double stride = layout.stride;

              _requestScrollAlignmentIfNeeded(stride: stride, count: count);

              return NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification n) =>
                    _handleScrollNotification(n, stride, count),
                child: ListView.builder(
                  key: UniqueKey(),
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  physics: _CarouselPhysics(
                    pageStride: stride,
                    startOffset: 0,
                    parent: const AlwaysScrollableScrollPhysics(),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: layout.sideInset),
                  itemCount: widget.itemCount,
                  itemBuilder: (BuildContext context, int index) {
                    print(
                      'index=$index, stride=$stride, viewportHeight=$viewportHeight, width=${layout.cardWidth}, height=${layout.cardHeight}',
                    );
                    return SizedBox(
                      width: stride,
                      height: viewportHeight,
                      child: Center(
                        child: SizedBox(
                          width: layout.cardWidth,
                          height: layout.cardHeight,
                          child: widget.itemBuilder(context, index, layout),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        if (widget.itemCount > 1)
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 4),
            child: ValueListenableBuilder<int>(
              valueListenable: _currentIndexNotifier,
              builder: (context, currentPage, _) {
                return _CarouselIndicator(
                  count: widget.itemCount,
                  currentIndex: currentPage,
                );
              },
            ),
          ),
      ],
    );
  }

  /// 根据滚动偏移与最大滚动距离更新指示器；滑到底强制末项。
  void _syncIndicator({
    required double pixels,
    required double stride,
    required int count,
    required double maxScrollExtent,
  }) {
    if (count <= 0 || stride <= 0) {
      return;
    }
    final int lastIndex = count - 1;
    const double endEpsilon = 2.0;
    if (lastIndex >= 0 && pixels >= maxScrollExtent - endEpsilon) {
      _handlePageChanged(lastIndex);
      return;
    }
    final int nextIndex = (pixels / stride + 0.5).floor().clamp(0, lastIndex);
    _handlePageChanged(nextIndex);
  }

  /// 在步长确定后同步滚动位置（首次进入 / 旋转导致步长变化）。
  void _requestScrollAlignmentIfNeeded({
    required double stride,
    required int count,
  }) {
    if (count <= 0) {
      return;
    }
    final bool needInitial = !_hasAppliedInitialOffset;
    final bool needRescale =
        _hasAppliedInitialOffset && (stride - _lastStride).abs() >= 0.5;
    if (!needInitial && !needRescale) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients) {
        return;
      }
      final double maxScroll = _scrollController.position.maxScrollExtent;
      if (!_hasAppliedInitialOffset) {
        _hasAppliedInitialOffset = true;
        final int initial = widget.initialIndex.clamp(
          0,
          math.max(0, count - 1),
        );
        final double target = (initial * stride).clamp(0.0, maxScroll);
        _scrollController.jumpTo(target);
        _currentIndexNotifier.value = initial;
        _lastStride = stride;
        return;
      }
      if (_lastStride > 0 && (stride - _lastStride).abs() > 0.5) {
        final int idx = (_scrollController.offset / _lastStride).round().clamp(
          0,
          count - 1,
        );
        final double target = (idx * stride).clamp(0.0, maxScroll);
        _scrollController.jumpTo(target);
        _currentIndexNotifier.value = idx;
      }
      _lastStride = stride;
    });
  }

  bool _handleScrollNotification(
    ScrollNotification notification,
    double stride,
    int count,
  ) {
    if (notification.metrics.axis != Axis.horizontal) {
      return false;
    }
    if (notification is ScrollUpdateNotification ||
        notification is OverscrollNotification ||
        notification is ScrollEndNotification) {
      _syncIndicator(
        pixels: notification.metrics.pixels,
        stride: stride,
        count: count,
        maxScrollExtent: notification.metrics.maxScrollExtent,
      );
    }
    return false;
  }
}

/// 轮播布局度量（卡片尺寸、步长、左右边距）。
class UgCarouselLayout {
  const UgCarouselLayout({
    required this.cardWidth,
    required this.cardHeight,
    required this.stride,
    required this.sideInset,
  });

  /// 单张卡片宽度。
  final double cardWidth;

  /// 单张卡片高度（与设计比例一致）。
  final double cardHeight;

  /// 相邻卡片起点间距（卡片宽 + 间距）。
  final double stride;

  /// ListView 水平 padding。
  final double sideInset;
}

/// 分页吸附物理效果，支持自定义步长和起始偏移。
class _CarouselPhysics extends ScrollPhysics {
  const _CarouselPhysics({
    required this.pageStride,
    this.startOffset = 0.0,
    this.snapThreshold = 0.5,
    super.parent,
  });

  /// 单页滚动步长
  final double pageStride;

  /// 第一个吸附点的偏移量
  final double startOffset;

  /// 吸附阈值（0.0 ~ 1.0），滑动超过此比例即翻页
  final double snapThreshold;

  @override
  _CarouselPhysics applyTo(ScrollPhysics? ancestor) {
    return _CarouselPhysics(
      pageStride: pageStride,
      startOffset: startOffset,
      snapThreshold: snapThreshold,
      parent: buildParent(ancestor),
    );
  }

  double getPageFromPixels(double pixels) {
    return (pixels - startOffset) / pageStride;
  }

  double getPixelsFromPage(double page) {
    return page * pageStride + startOffset;
  }

  @override
  Simulation? createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    // 边界检查
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }

    final Tolerance tolerance = this.tolerance;
    double page = getPageFromPixels(position.pixels);

    // 根据速度方向决定目标页
    if (velocity < -tolerance.velocity) {
      page -= snapThreshold;
    } else if (velocity > tolerance.velocity) {
      page += snapThreshold;
    }

    final double target = getPixelsFromPage(
      page.roundToDouble(),
    ).clamp(position.minScrollExtent, position.maxScrollExtent);

    if ((target - position.pixels).abs() > tolerance.distance) {
      return ScrollSpringSimulation(
        spring,
        position.pixels,
        target,
        velocity,
        tolerance: tolerance,
      );
    }
    return null;
  }

  // @override
  // SpringDescription get spring => SpringDescription.withDampingRatio(
  //   mass: 0.5,
  //   stiffness: 400.0,
  //   ratio: 1.05,
  // );
}

class _CarouselIndicator extends StatelessWidget {
  const _CarouselIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
    this.activeColor,
    this.inactiveColor,
    this.dotSize,
    this.activeDotSize,
    this.radius,
    this.spacing,
  });

  final int count;
  final int currentIndex;
  final Color? activeColor;
  final Color? inactiveColor;
  final Size? dotSize;
  final Size? activeDotSize;
  final double? radius;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(count, (int index) {
        final bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration: kThemeAnimationDuration,
          margin: EdgeInsets.symmetric(
            horizontal: spacing != null ? (spacing! / 2) : 4,
          ),
          width: isActive
              ? (activeDotSize?.width ?? 12)
              : (dotSize?.width ?? 6),
          height: isActive
              ? (activeDotSize?.height ?? 6)
              : (dotSize?.height ?? 6),
          decoration: BoxDecoration(
            color: isActive
                ? (activeColor ?? Color(0xFF0055FF))
                : (inactiveColor ?? Color(0x0F000000)),
            borderRadius: BorderRadius.circular(radius ?? 3),
          ),
        );
      }),
    );
  }
}

@optionalTypeArgs
class _StableGlobalKey<T extends State<StatefulWidget>> extends GlobalKey<T> {
  const _StableGlobalKey(this.value) : super.constructor();

  final Object value;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is _StableGlobalKey<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'StableGlobalKey($value)';
  }
}
