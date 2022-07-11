import 'package:flutter/material.dart';

import 'list_view_example_01_page.dart';
import 'list_view_example_02_page.dart';
import 'list_view_example_03_page.dart';
import 'list_view_example_04_page.dart';
import 'list_view_example_05_page.dart';
import 'list_view_example_06_page.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ListView系列组件'),
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(text: '普通用法'),
              Tab(text: 'builder用法'),
              Tab(text: 'seperated用法'),
              Tab(text: '下拉刷新用法'),
              Tab(text: '上拉加载用法'),
              Tab(text: 'AnimatedList'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListViewExample01Page(),
            ListViewExample02Page(),
            ListViewExample03Page(),
            ListViewExample04Page(),
            ListViewExample05Page(),
            ListViewExample06Page(),
          ],
        ),
      ),
    );
  }
}
