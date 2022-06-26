import 'package:flutter/material.dart';

import 'nested_scroll_view_page.dart';
import 'sliver_example_01_page.dart';
import 'sliver_example_02_page.dart';
import 'sliver_example_03_page.dart';
import 'sliver_example_04_page.dart';
import 'sliver_example_05_page.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliver系列组件')),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildItem(context, 'Grid和List的混合使用', SliverExample01Page()),
              _buildItem(
                context,
                'SliverAppBar的使用',
                SliverExample02Page(type: 0),
              ),
              _buildItem(
                context,
                'SliverAppBar-Float效果',
                SliverExample02Page(type: 1),
              ),
              _buildItem(
                context,
                'SliverAppBar-Snap效果',
                SliverExample02Page(type: 2),
              ),
              _buildItem(
                context,
                'SliverAppBar-Pinned效果',
                SliverExample02Page(type: 3),
              ),
              _buildItem(
                context,
                'SliverPersistentHeader的使用',
                SliverExample03Page(),
              ),
              _buildItem(
                context,
                'SliverScaleHeader的使用',
                SliverExample04Page(),
              ),
              _buildItem(
                context,
                '结合DataTable的使用',
                SliverExample05Page(),
              ),
              _buildItem(
                context,
                'NestedScrollView的使用',
                NestedScrollViewPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, String title, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return page;
            },
          ),
        );
      },
      child: Text(title),
    );
  }
}
