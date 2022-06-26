import 'package:flutter/material.dart';

class SliverExample03Page extends StatefulWidget {
  const SliverExample03Page({Key? key}) : super(key: key);

  @override
  _SliverExample03PageState createState() =>
      _SliverExample03PageState();
}

class _SliverExample03PageState extends State<SliverExample03Page>
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
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            snap: false,
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver-sticky效果'),
              background: Image.asset(
                'assets/images/mingren.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            // floating: true,
            delegate: StickyTabBarDelegate(
              child: TabBar(
                labelColor: Colors.black,
                controller: _tabController,
                tabs: <Tab>[
                  Tab(text: 'Home'),
                  Tab(text: 'Profile'),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                // Center(child: Text('Content of Home')),
                Column(
                  children: <Widget>[
                    Text('Content of Home'),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(height: 60, color: Colors.red);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                      ),
                    ),
                  ],
                ),
                Center(child: Text('Content of Profile')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  StickyTabBarDelegate({
    required this.child,
    this.color = Colors.white,
  });

  final Color color;
  final TabBar child;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      color: color,
      child: child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
