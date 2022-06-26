import 'package:flutter/material.dart';

import 'grid_view_example_01_page.dart';
import 'grid_view_example_02_page.dart';
import 'grid_view_example_03_page.dart';
import 'grid_view_example_04_page.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('GridView系统组件'),
          bottom: TabBar(
            isScrollable: true,
            tabs: <Tab>[
              Tab(text: '普通用法'),
              Tab(text: 'build用法'),
              Tab(text: 'count用法'),
              Tab(text: 'extent用法'),
            ],
          ),
        ),
        body: TabBarView(
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
