import 'package:app/custom/sliver_flexible_header_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverPersistentHeaderToBoxPage extends StatelessWidget {
  const SliverPersistentHeaderToBoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SliverPersistentHeaderToBox控件')),
      body: CustomScrollView(
        slivers: [
          _buildSliverList(5),
          SliverPersistentHeaderToBox.builder(builder: _headerBuilder),
          _buildSliverList(5),
          SliverPersistentHeaderToBox(child: _buildWTitle('Title 2')),
          _buildSliverList(5),
          SliverPersistentHeaderToBox(child: _buildWTitle('Title 3')),
          _buildSliverList(20),
        ],
      ),
    );
  }

  // 当 header 固定后显示阴影
  Widget _headerBuilder(context, maxExtent, fixed) {
    // 获取当前应用主题，关于主题相关内容将在后面章节介绍，现在
    // 我们要从主题中获取一些颜色。
    var theme = Theme.of(context);
    return Material(
      elevation: fixed ? 4 : 0,
      shadowColor: theme.appBarTheme.shadowColor,
      child: Container(
        color: fixed ? Colors.white : theme.canvasColor,
        child: _buildWTitle('Title 1'),
      ),
    );
  }

  // 我们约定小写字母 w 开头的函数代表是需要构建一个 Widget，这比 buildXX 会更简洁
  Widget _buildWTitle(String text) {
    return ColoredBox(
      color: Colors.white,
      child: ListTile(
        title: Text(text),
        onTap: () => print(text),
      ),
    );
  }

  Widget _buildSliverList(int itemCount) {
    return SliverList.builder(
      itemBuilder: (_, int index) {
        return Container(
          height: 50,
          width: double.infinity,
          color: Colors.primaries[index % Colors.primaries.length],
          alignment: Alignment.center,
          child: Text(index.toString()),
        );
      },
      itemCount: itemCount,
    );
  }
}

typedef SliverPersistentHeaderToBoxBuilder = Widget Function(
  BuildContext context,
  double maxExtent, //当前可用最大高度
  bool fixed, // 是否已经固定
);

class SliverPersistentHeaderToBox extends StatelessWidget {
  // 默认构造函数，直接接受一个 widget，不用显式指定高度
  SliverPersistentHeaderToBox({
    Key? key,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        super(key: key);

  // builder 构造函数，需要传一个 builder，同样不需要显式指定高度
  const SliverPersistentHeaderToBox.builder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final SliverPersistentHeaderToBoxBuilder builder;

  @override
  Widget build(BuildContext context) {
    return _SliverPersistentHeaderToBox(
      // 通过 LayoutBuilder接收 Sliver 传递给子组件的布局约束信息
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return builder(
            context,
            constraints.maxHeight,
            //约束中需要传递的额外信息是一个bool类型，表示 Sliver 是否已经固定到顶部
            (constraints as ExtraInfoBoxConstraints<bool>).extra,
          );
        },
      ),
    );
  }
}

class _SliverPersistentHeaderToBox extends SingleChildRenderObjectWidget {
  const _SliverPersistentHeaderToBox({super.child});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderSliverPersistentHeaderToBox();
  }
}

class _RenderSliverPersistentHeaderToBox extends RenderSliverToBoxAdapter {
  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }
    child!.layout(
      ExtraInfoBoxConstraints(
        //只要 constraints.scrollOffset不为0，则表示已经有内容在当前Sliver下面了，即已经固定到顶部了
        constraints.scrollOffset != 0,
        constraints.asBoxConstraints(
          // 我们将剩余的可绘制空间作为 header 的最大高度约束传递给 LayoutBuilder
          maxExtent: constraints.remainingPaintExtent,
        ),
      ),
      //我们要根据child大小来确定Sliver大小，所以后面需要用到child的大小（size）信息
      parentUsesSize: true,
    );

    // 子节点 layout 后就能获取它的大小了
    double childExtent;
    switch (constraints.axis) {
      case Axis.horizontal:
        childExtent = child!.size.width;
        break;
      case Axis.vertical:
        childExtent = child!.size.height;
        break;
    }

    // final double paintedChildSize =
    //     calculatePaintOffset(constraints, from: 0.0, to: childExtent);
    // final double cacheExtent =
    //     calculateCacheOffset(constraints, from: 0.0, to: childExtent);

    geometry = SliverGeometry(
      scrollExtent: childExtent,
      paintOrigin: 0, // 固定，如果不想固定应该传` - constraints.scrollOffset`
      paintExtent: childExtent,
      maxPaintExtent: childExtent,
    );
  }

  // 重要，必须重写，下面介绍。
  @override
  double childMainAxisPosition(RenderBox child) => 0.0;
}
