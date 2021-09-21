import 'package:app/pages/sliver/sliver_example_03_activity.dart';
import 'package:flutter/material.dart';

class NestedScrollViewWidgetActivity extends StatefulWidget {
  const NestedScrollViewWidgetActivity({Key? key}) : super(key: key);

  @override
  _NestedScrollViewWidgetActivityState createState() =>
      _NestedScrollViewWidgetActivityState();
}

class _NestedScrollViewWidgetActivityState
    extends State<NestedScrollViewWidgetActivity>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            _buildSliverAppBar(),
            _buildTabBar(),
          ];
        },
        body: _buildBody(),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      title: Text('NestedScrollView控件'),
      expandedHeight: 250,
      pinned: true,
      // flexibleSpace: FlexibleSpaceBar(
      //   title: Text('NestedScrollView控件'),
      //   background: Image.asset(
      //     'assets/images/mingren.jpeg',
      //     fit: BoxFit.cover,
      //   ),
      // ),
      flexibleSpace: PageView(
        children: [
          Image.asset(
            'assets/images/mingren.jpeg',
            fit: BoxFit.cover,
          ),
          Container(color: Colors.yellow),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: StickyTabBarDelegate(
        color: Colors.white,
        child: TabBar(
          labelColor: Colors.black,
          controller: _tabController,
          tabs: <Tab>[
            Tab(text: 'Home'),
            Tab(text: 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        _buildListView(),
        _buildListView(),
      ],
    );
  }

  Widget _buildListView() {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.primaries[index],
            height: 100,
            child: Text(
              index.toString(),
              style: TextStyle(
                fontSize: 21,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
        itemCount: Colors.primaries.length,
      ),
    );
  }
}
