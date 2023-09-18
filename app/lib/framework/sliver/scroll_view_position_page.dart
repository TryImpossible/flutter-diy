import 'dart:math';

import 'package:flutter/material.dart';

class ScrollViewPositionPage extends StatelessWidget {
  const ScrollViewPositionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ScrollView定位的使用'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(text: 'ScrollView'),
              Tab(text: 'ListView'),
              Tab(text: 'GridView'),
              Tab(text: 'CustomScrollView'),
              Tab(text: 'NestedScrollView'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _PositionSingleScrollView(),
            _PositionListView(),
            _PositionGridView(),
            _PositionCustomScrollView(),
            _PositionNestedScrollView(),
          ],
        ),
      ),
    );
  }
}

class _PositionSingleScrollView extends StatelessWidget {
  _PositionSingleScrollView({super.key});

  final ScrollController _controller = ScrollController();
  final GlobalKey _positionKey = GlobalKey();
  final GlobalKey _positionInnerKey = GlobalKey();

  void _position() {
    final RenderObject? renderObject =
        _positionKey.currentContext?.findRenderObject();
    if (renderObject != null) {
      _controller.position.ensureVisible(
        renderObject,
        alignment: 0.0,
        duration: kThemeAnimationDuration,
        targetRenderObject:
            _positionInnerKey.currentContext?.findRenderObject(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: List.generate(30, _buildItem).toList(),
        ),
      ),
      floatingActionButton: CircleAvatar(
        child: IconButton(
          onPressed: _position,
          icon: const Icon(Icons.location_searching),
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    if (index == 15) {
      return Container(
        key: _positionKey,
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.only(bottom: 1),
        color: Colors.greenAccent.withOpacity(0.3),
        alignment: Alignment.bottomCenter,
        child: ColoredBox(
          key: _positionInnerKey,
          color: Colors.greenAccent,
          child: Text(index.toString()),
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: 30 + Random().nextDouble() * 100,
      margin: const EdgeInsets.only(bottom: 1),
      color: Colors.redAccent.withOpacity(0.3),
      alignment: Alignment.center,
      child: Text(index.toString()),
    );
  }
}

class _PositionListView extends StatelessWidget {
  _PositionListView({super.key});

  final ScrollController _controller = ScrollController();
  final GlobalKey _positionKey = GlobalKey();
  final GlobalKey _positionInnerKey = GlobalKey();

  void _position() {
    final RenderObject? renderObject =
        _positionKey.currentContext?.findRenderObject();
    if (renderObject != null) {
      _controller.position.ensureVisible(
        renderObject,
        alignment: 0.0,
        duration: kThemeAnimationDuration,
        targetRenderObject:
            _positionInnerKey.currentContext?.findRenderObject(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: _controller,
        cacheExtent: MediaQuery.of(context).size.height,
        itemBuilder: (_, int index) {
          return _buildItem(index);
        },
        itemCount: 30,
      ),
      floatingActionButton: CircleAvatar(
        child: IconButton(
          onPressed: _position,
          icon: const Icon(Icons.location_searching),
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    if (index == 15) {
      return Container(
        key: _positionKey,
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.only(bottom: 1),
        color: Colors.greenAccent.withOpacity(0.3),
        alignment: Alignment.bottomCenter,
        child: ColoredBox(
          key: _positionInnerKey,
          color: Colors.greenAccent,
          child: Text(index.toString()),
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: 30 + Random().nextDouble() * 100,
      margin: const EdgeInsets.only(bottom: 1),
      color: Colors.redAccent.withOpacity(0.3),
      alignment: Alignment.center,
      child: Text(index.toString()),
    );
  }
}

class _PositionGridView extends StatelessWidget {
  _PositionGridView({super.key});

  final ScrollController _controller = ScrollController();
  final GlobalKey _positionKey = GlobalKey();
  final GlobalKey _positionInnerKey = GlobalKey();

  void _position() {
    final RenderObject? renderObject =
        _positionKey.currentContext?.findRenderObject();
    if (renderObject != null) {
      _controller.position.ensureVisible(
        renderObject,
        alignment: 0.0,
        duration: kThemeAnimationDuration,
        targetRenderObject:
            _positionInnerKey.currentContext?.findRenderObject(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        controller: _controller,
        cacheExtent: MediaQuery.of(context).size.height,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
        ),
        itemBuilder: (_, int index) {
          return _buildItem(index);
        },
        itemCount: 30,
      ),
      floatingActionButton: CircleAvatar(
        child: IconButton(
          onPressed: _position,
          icon: const Icon(Icons.location_searching),
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    if (index == 15) {
      return Container(
        key: _positionKey,
        width: double.infinity,
        height: 60,
        color: Colors.greenAccent.withOpacity(0.3),
        alignment: Alignment.bottomCenter,
        child: ColoredBox(
          key: _positionInnerKey,
          color: Colors.greenAccent,
          child: Text(index.toString()),
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: 30 + Random().nextDouble() * 100,
      color: Colors.redAccent.withOpacity(0.3),
      alignment: Alignment.center,
      child: Text(index.toString()),
    );
  }
}

class _PositionCustomScrollView extends StatelessWidget {
  _PositionCustomScrollView({super.key});

  final ScrollController _controller = ScrollController();
  final GlobalKey _positionKey = GlobalKey();
  final GlobalKey _positionInnerKey = GlobalKey();

  void _position() {
    final RenderObject? renderObject =
        _positionKey.currentContext?.findRenderObject();
    if (renderObject != null) {
      _controller.position.ensureVisible(
        renderObject,
        alignment: 0.0,
        duration: kThemeAnimationDuration,
        targetRenderObject:
            _positionInnerKey.currentContext?.findRenderObject(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        cacheExtent: MediaQuery.of(context).size.height,
        slivers: <Widget>[
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
            ),
            itemBuilder: (_, int index) {
              return Container(
                color: Colors.redAccent,
              );
            },
            itemCount: 3,
          ),
          SliverMainAxisGroup(
            slivers: <Widget>[
              SliverList.separated(
                itemBuilder: (_, int index) {
                  return _buildItem(index);
                },
                separatorBuilder: (_, int index) {
                  return const SizedBox(height: 1.0);
                },
                itemCount: 30,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: CircleAvatar(
        child: IconButton(
          onPressed: _position,
          icon: const Icon(Icons.location_searching),
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    if (index == 15) {
      return Container(
        key: _positionKey,
        width: double.infinity,
        height: 60,
        color: Colors.greenAccent.withOpacity(0.3),
        alignment: Alignment.bottomCenter,
        child: ColoredBox(
          key: _positionInnerKey,
          color: Colors.greenAccent,
          child: Text(index.toString()),
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: 30 + Random().nextDouble() * 100,
      color: Colors.redAccent.withOpacity(0.3),
      alignment: Alignment.center,
      child: Text(index.toString()),
    );
  }
}

class _PositionNestedScrollView extends StatelessWidget {
  _PositionNestedScrollView({super.key});

  final ScrollController _controller = ScrollController();
  final GlobalKey _positionKey = GlobalKey();
  final GlobalKey _positionInnerKey = GlobalKey();

  void _position() {
    // final RenderObject? renderObject =
    //     _positionKey.currentContext?.findRenderObject();
    // if (renderObject != null) {
    //   _controller.position.ensureVisible(
    //     renderObject,
    //     alignment: 0.0,
    //     duration: kThemeAnimationDuration,
    //     targetRenderObject:
    //         _positionInnerKey.currentContext?.findRenderObject(),
    //   );
    // }

    if (_positionKey.currentContext != null) {
      //滚动到指定位置
      Scrollable.ensureVisible(
        _positionKey.currentContext!,
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _controller,
        headerSliverBuilder: (
          BuildContext context,
          bool innerBoxIsScrolled,
        ) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 300,
                color: Colors.black12,
              ),
            ),
          ];
        },
        body: CustomScrollView(
          cacheExtent: MediaQuery.of(context).size.height * 3,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                height: 200,
                alignment: Alignment.center,
                child: const Text('CustomScrollView Header'),
              ),
            ),
            SliverMainAxisGroup(
              slivers: <Widget>[
                SliverMainAxisGroup(
                  slivers: <Widget>[
                    SliverList.separated(
                      itemBuilder: (_, int index) {
                        return _buildItem(index);
                      },
                      separatorBuilder: (_, int index) {
                        return const SizedBox(height: 1.0);
                      },
                      itemCount: 30,
                    ),
                  ],
                ),
                SliverMainAxisGroup(
                  slivers: <Widget>[
                    SliverList.separated(
                      itemBuilder: (_, int index) {
                        return Container(
                          width: double.infinity,
                          height: 30 + Random().nextDouble() * 100,
                          color: Colors.blueAccent.withOpacity(0.3),
                          alignment: Alignment.center,
                          child: Text(index.toString()),
                        );
                      },
                      separatorBuilder: (_, int index) {
                        return const SizedBox(height: 1.0);
                      },
                      itemCount: 30,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: CircleAvatar(
        child: IconButton(
          onPressed: _position,
          icon: const Icon(Icons.location_searching),
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    if (index == 15) {
      return Container(
        key: _positionKey,
        width: double.infinity,
        height: 60,
        color: Colors.greenAccent.withOpacity(0.3),
        alignment: Alignment.bottomCenter,
        child: ColoredBox(
          key: _positionInnerKey,
          color: Colors.greenAccent,
          child: Text(index.toString()),
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: 30 + Random().nextDouble() * 100,
      color: Colors.redAccent.withOpacity(0.3),
      alignment: Alignment.center,
      child: Text(index.toString()),
    );
  }
}
