import 'package:flutter/material.dart';

import 'staggered_grid_view.dart';

enum _ExampleType {
  sliverBuilder,
  sliverCount,
  sliverExtent,
  viewCustom,
  viewBuilder,
  viewCount,
  viewExtent,
}

class _ExampleDescription {
  const _ExampleDescription(this.title, this.description, this.details);
  final String title;
  final String description;
  final List<String> details;
}

/// 展示 SliverStaggeredGrid 与 StaggeredGridView 全部公开构造函数的示例页面。
class StaggeredGridViewPage extends StatefulWidget {
  const StaggeredGridViewPage({super.key});

  @override
  State<StaggeredGridViewPage> createState() => _StaggeredGridViewPageState();
}

class _StaggeredGridViewPageState extends State<StaggeredGridViewPage> {
  /// builder 示例首次展示的数据量。
  static const int _initialBuilderItemCount = 20;

  /// 每次触发加载时追加的数据量。
  static const int _builderPageSize = 20;

  /// 示例页为避免无限增长设置的最大数据量。
  static const int _maxBuilderItemCount = 300;

  /// 距离底部小于该值时开始预加载下一页。
  static const double _loadMoreTriggerExtent = 300;

  /// 当前选中的构造函数示例。
  _ExampleType _type = _ExampleType.sliverBuilder;

  /// 静态示例和刷新后的尺寸偏移量。
  int _heightOffset = 0;

  /// builder 示例当前的数据数量，不包含 footer。
  int _builderItemCount = _initialBuilderItemCount;

  /// 是否正在执行下拉刷新请求。
  bool _isRefreshing = false;

  /// 是否正在执行上拉加载请求。
  bool _isLoadingMore = false;

  /// 是否仍有可追加的模拟数据。
  bool _hasMore = true;

  /// 用于使刷新前已经发出的异步加载请求失效。
  int _requestGeneration = 0;

  /// builder 示例复用的布局委托，只有布局数据变化时才替换。
  late SliverStaggeredGridDelegate _builderDelegate;

  @override
  void initState() {
    super.initState();
    _builderDelegate = _createBuilderDelegate();
  }

  void _refreshLayout() =>
      setState(() => _heightOffset = (_heightOffset + 20) % 60);

  /// 刷新 builder 示例的数据，并使旧的加载请求失效。
  Future<void> _onRefresh() async {
    final int generation = ++_requestGeneration;
    setState(() {
      _isRefreshing = true;
      _isLoadingMore = false;
    });
    await Future<void>.delayed(const Duration(milliseconds: 600));
    if (!mounted || generation != _requestGeneration) {
      return;
    }
    setState(() {
      _builderItemCount = _initialBuilderItemCount;
      _heightOffset = (_heightOffset + 20) % 60;
      _hasMore = true;
      _isRefreshing = false;
      _updateBuilderDelegate();
    });
  }

  /// 在滚动接近底部时追加一页 builder 数据。
  Future<void> _loadMore() async {
    if (_isRefreshing || _isLoadingMore || !_hasMore) {
      return;
    }
    final int generation = _requestGeneration;
    setState(() => _isLoadingMore = true);
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (!mounted || generation != _requestGeneration) {
      return;
    }
    setState(() {
      _builderItemCount = (_builderItemCount + _builderPageSize).clamp(
        0,
        _maxBuilderItemCount,
      );
      _hasMore = _builderItemCount < _maxBuilderItemCount;
      _isLoadingMore = false;
      _updateBuilderDelegate();
    });
  }

  /// 处理滚动通知，在接近列表尾部时触发分页加载。
  bool _onBuilderScrollNotification(ScrollNotification notification) {
    if (notification.metrics.extentAfter < _loadMoreTriggerExtent) {
      _loadMore();
    }
    return false;
  }

  /// 创建包含 footer 索引的 builder 布局委托。
  /// footer 索引随数据量变化，因此仅在数据变化时创建新的布局闭包。
  SliverStaggeredGridDelegate _createBuilderDelegate() {
    final int footerIndex = _builderItemCount;
    final int heightOffset = _heightOffset;
    return SliverStaggeredGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      fullSpanBuilder: (int index) =>
          index == footerIndex || _isFullSpan(index),
      mainAxisExtentBuilder: (int index) {
        if (index == footerIndex) {
          return 64;
        }
        return (_isFullSpan(index) ? 72 : 96 + (index % 5) * 28 + heightOffset)
            .toDouble();
      },
    );
  }

  /// 使用最新的数据数量和尺寸版本替换 builder 布局委托。
  void _updateBuilderDelegate() {
    _builderDelegate = _createBuilderDelegate();
  }

  /// 判断当前示例是否使用懒加载 builder。
  bool get _isBuilderExample =>
      _type == _ExampleType.sliverBuilder || _type == _ExampleType.viewBuilder;

  /// 统一处理 AppBar 刷新按钮在不同示例下的行为。
  void _handleRefreshAction() {
    if (_isBuilderExample) {
      _onRefresh();
    } else {
      _refreshLayout();
    }
  }

  bool _isFullSpan(int index) => index % 11 == 0;

  double _mainAxisExtent(int index) =>
      (_isFullSpan(index) ? 72 : 96 + (index % 5) * 28 + _heightOffset)
          .toDouble();

  Widget _buildItem(BuildContext context, int index) {
    final bool fullSpan = _isFullSpan(index);
    return Card(
      key: ValueKey<int>(index),
      margin: EdgeInsets.zero,
      color: Colors.primaries[index % Colors.primaries.length],
      child: Center(
        child: Text(
          fullSpan ? '全宽 item $index' : 'item $index',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  /// 构建 builder 数据项或列表末尾的分页 footer。
  Widget _buildBuilderItem(BuildContext context, int index) {
    if (index == _builderItemCount) {
      return _buildLoadMoreFooter();
    }
    return _buildItem(context, index);
  }

  /// 根据分页状态显示加载提示、进度指示器或结束提示。
  Widget _buildLoadMoreFooter() {
    final String message = !_hasMore
        ? '没有更多数据'
        : _isLoadingMore
        ? '正在加载更多…'
        : '上拉加载更多';
    return SizedBox(
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (_isLoadingMore) ...<Widget>[
            const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: 8),
          ],
          Text(message),
        ],
      ),
    );
  }

  /// 为两个 builder 示例复用刷新和滚动分页容器。
  Widget _wrapBuilderScrollView(Widget child) => RefreshIndicator(
    onRefresh: _onRefresh,
    child: NotificationListener<ScrollNotification>(
      onNotification: _onBuilderScrollNotification,
      child: child,
    ),
  );

  List<Widget> _buildChildren(int count) =>
      List<Widget>.generate(count, (int index) => _buildItem(context, index));

  SliverStaggeredGridDelegate _fixedDelegate() =>
      SliverStaggeredGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        fullSpanBuilder: _isFullSpan,
        mainAxisExtentBuilder: _mainAxisExtent,
      );

  _ExampleDescription get _description =>
      const <_ExampleType, _ExampleDescription>{
        _ExampleType.sliverBuilder: _ExampleDescription(
          'SliverStaggeredGrid.builder',
          'Sliver 懒加载构造函数。',
          <String>['固定 2 列', 'itemCount 控制数量', '适合长列表和大量数据'],
        ),
        _ExampleType.sliverCount: _ExampleDescription(
          'SliverStaggeredGrid.count',
          '固定列数的非懒加载 Sliver。',
          <String>['children 一次性持有', '支持全宽 item', '适合少量静态数据'],
        ),
        _ExampleType.sliverExtent: _ExampleDescription(
          'SliverStaggeredGrid.extent',
          '按最大列宽动态计算列数。',
          <String>['最大列宽 180', '窗口宽度变化时重新布局', '适合响应式布局'],
        ),
        _ExampleType.viewCustom: _ExampleDescription(
          'StaggeredGridView.custom',
          '直接传入 SliverChildDelegate。',
          <String>['BoxScrollView 包装器', '自定义 childrenDelegate', '支持 padding'],
        ),
        _ExampleType.viewBuilder: _ExampleDescription(
          'StaggeredGridView.builder',
          '可直接使用的懒加载滚动视图。',
          <String>['按需创建子节点', '适合大量数据', '内部使用 SliverStaggeredGrid'],
        ),
        _ExampleType.viewCount: _ExampleDescription(
          'StaggeredGridView.count',
          '固定列数的滚动视图快捷构造函数。',
          <String>['静态 children', '固定 2 列', '支持全宽 item'],
        ),
        _ExampleType.viewExtent: _ExampleDescription(
          'StaggeredGridView.extent',
          '动态列数的滚动视图快捷构造函数。',
          <String>['最大列宽 180', '静态 children', '自动处理滚动'],
        ),
      }[_type]!;

  Widget _buildExample() {
    switch (_type) {
      case _ExampleType.sliverBuilder:
        return _wrapBuilderScrollView(
          CustomScrollView(
            slivers: <Widget>[
              SliverStaggeredGrid.builder(
                itemCount: _builderItemCount + 1,
                gridDelegate: _builderDelegate,
                itemBuilder: _buildBuilderItem,
              ),
            ],
          ),
        );
      case _ExampleType.sliverCount:
        return CustomScrollView(
          slivers: <Widget>[
            SliverStaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisExtentBuilder: _mainAxisExtent,
              fullSpanBuilder: _isFullSpan,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: _buildChildren(20),
            ),
          ],
        );
      case _ExampleType.sliverExtent:
        return CustomScrollView(
          slivers: <Widget>[
            SliverStaggeredGrid.extent(
              maxCrossAxisExtent: 180,
              mainAxisExtentBuilder: _mainAxisExtent,
              fullSpanBuilder: _isFullSpan,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: _buildChildren(20),
            ),
          ],
        );
      case _ExampleType.viewCustom:
        return StaggeredGridView.custom(
          padding: const EdgeInsets.all(12),
          gridDelegate: _fixedDelegate(),
          childrenDelegate: SliverChildListDelegate(_buildChildren(20)),
        );
      case _ExampleType.viewBuilder:
        return _wrapBuilderScrollView(
          StaggeredGridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: _builderDelegate,
            itemCount: _builderItemCount + 1,
            itemBuilder: _buildBuilderItem,
          ),
        );
      case _ExampleType.viewCount:
        return StaggeredGridView.count(
          padding: const EdgeInsets.all(12),
          crossAxisCount: 2,
          mainAxisExtentBuilder: _mainAxisExtent,
          fullSpanBuilder: _isFullSpan,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: _buildChildren(20),
        );
      case _ExampleType.viewExtent:
        return StaggeredGridView.extent(
          padding: const EdgeInsets.all(12),
          maxCrossAxisExtent: 180,
          mainAxisExtentBuilder: _mainAxisExtent,
          fullSpanBuilder: _isFullSpan,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: _buildChildren(20),
        );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('StaggeredGrid API 示例'),
      actions: <Widget>[
        IconButton(
          onPressed: _handleRefreshAction,
          icon: const Icon(Icons.refresh),
          tooltip: '刷新布局',
        ),
      ],
    ),
    body: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12),
          child: DropdownButtonFormField<_ExampleType>(
            initialValue: _type,
            decoration: const InputDecoration(
              labelText: '选择构造函数',
              border: OutlineInputBorder(),
            ),
            items: _ExampleType.values
                .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                .toList(),
            onChanged: (e) => setState(() => _type = e!),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _description.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(_description.description),
                ..._description.details.map((d) => Text('• $d')),
              ],
            ),
          ),
        ),
        const Divider(),
        Expanded(child: _buildExample()),
      ],
    ),
  );
}
