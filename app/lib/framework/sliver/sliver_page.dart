import 'package:flutter/material.dart';

import 'nested_scroll_view_page.dart';
import 'scroll_view_position_page.dart';
import 'sliver_example_01_page.dart';
import 'sliver_example_02_page.dart';
import 'sliver_example_03_page.dart';
import 'sliver_example_04_page.dart';
import 'sliver_example_05_page.dart';
import 'sliver_layout_builder_page.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sliver系列组件')),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildItem(
                  context, 'Grid和List的混合使用', const SliverExample01Page()),
              _buildItem(
                context,
                'SliverAppBar的使用',
                const SliverExample02Page(type: 0),
              ),
              _buildItem(
                context,
                'SliverAppBar-Float效果',
                const SliverExample02Page(type: 1),
              ),
              _buildItem(
                context,
                'SliverAppBar-Snap效果',
                const SliverExample02Page(type: 2),
              ),
              _buildItem(
                context,
                'SliverAppBar-Pinned效果',
                const SliverExample02Page(type: 3),
              ),
              _buildItem(
                context,
                'SliverPersistentHeader的使用',
                const SliverExample03Page(),
              ),
              _buildItem(
                context,
                'SliverScaleHeader的使用',
                const SliverExample04Page(),
              ),
              _buildItem(
                context,
                '结合DataTable的使用',
                const SliverExample05Page(),
              ),
              _buildItem(
                context,
                'SliverLayoutBuilder',
                const SliverLayoutBuilderPage(),
              ),
              _buildItem(
                context,
                'NestedScrollView的使用',
                const NestedScrollViewPage(),
              ),
              _buildItem(
                context,
                'ScrollView定位的使用',
                const ScrollViewPositionPage(),
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
