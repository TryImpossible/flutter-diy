import 'package:flutter/material.dart';

import 'grid_view_example_01_page.dart';
import 'grid_view_example_02_page.dart';
import 'grid_view_example_03_page.dart';
import 'grid_view_example_04_page.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GridView系列组件'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Tab>[
              Tab(text: '普通用法'),
              Tab(text: 'build用法'),
              Tab(text: 'count用法'),
              Tab(text: 'extent用法'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            GridViewExample01Page(),
            GridViewExample02Page(),
            GridViewExample03Page(),
            GridViewExample04Page(),
          ],
        ),
      ),
    );
  }
}
