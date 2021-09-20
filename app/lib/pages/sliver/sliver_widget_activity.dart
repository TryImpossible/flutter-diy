import 'package:app/pages/sliver/sliver_example_01_activity.dart';
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
              _buildItem(context, '普通用法', SliverExample01Activity()),
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
