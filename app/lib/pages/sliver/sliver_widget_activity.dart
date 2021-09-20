import 'package:app/pages/sliver/sliver_example_01_activity.dart';
import 'package:app/pages/sliver/sliver_example_02_activity.dart';
import 'package:app/pages/sliver/sliver_example_03_activity.dart';
import 'package:app/pages/sliver/sliver_example_04_activity.dart';
import 'package:flutter/material.dart';

class SliverWidgetActivity extends StatelessWidget {
  const SliverWidgetActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliver系列组件')),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildItem(context, 'Grid和List的混合使用', SliverExample01Activity()),
              _buildItem(
                context,
                'SliverAppBar的使用',
                SliverExample02Activity(type: 0),
              ),
              _buildItem(
                context,
                'SliverAppBar-Float效果',
                SliverExample02Activity(type: 1),
              ),
              _buildItem(
                context,
                'SliverAppBar-Snap效果',
                SliverExample02Activity(type: 2),
              ),
              _buildItem(
                context,
                'SliverAppBar-Pinned效果',
                SliverExample02Activity(type: 3),
              ),
              _buildItem(
                context,
                'SliverPersistentHeader的使用',
                SliverExample03Activity(),
              ),
              _buildItem(
                context,
                'SliverScaleHeader的使用',
                SliverExample04Activity(),
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
