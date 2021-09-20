import 'package:app/pages/listview/list_view_example_01_fragment.dart';
import 'package:app/pages/listview/list_view_example_02_fragment.dart';
import 'package:app/pages/listview/list_view_example_03_fragment.dart';
import 'package:app/pages/listview/list_view_example_04_fragment.dart';
import 'package:app/pages/listview/list_view_example_05_fragment.dart';
import 'package:flutter/material.dart';


class ListViewWidgetActivity extends StatelessWidget {
  const ListViewWidgetActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListViewExample01Fragment(),
            ListViewExample02Fragment(),
            ListViewExample03Fragment(),
            ListViewExample04Fragment(),
            ListViewExample05Fragment(),
          ],
        ),
      ),
    );
  }
}
