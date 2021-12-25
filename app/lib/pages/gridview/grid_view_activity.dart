import 'package:app/pages/gridview/grid_view_example_01_fragment.dart';
import 'package:app/pages/gridview/grid_view_example_02_fragment.dart';
import 'package:app/pages/gridview/grid_view_example_03_fragment.dart';
import 'package:app/pages/gridview/grid_view_example_04_fragment.dart';
import 'package:flutter/material.dart';

class GridViewActivity extends StatefulWidget {
  const GridViewActivity({Key? key}) : super(key: key);

  @override
  _GridViewActivityState createState() => _GridViewActivityState();
}

class _GridViewActivityState extends State<GridViewActivity> {
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
            GridViewExample01Fragment(),
            GridViewExample02Fragment(),
            GridViewExample03Fragment(),
            GridViewExample04Fragment(),
          ],
        ),
      ),
    );
  }
}
