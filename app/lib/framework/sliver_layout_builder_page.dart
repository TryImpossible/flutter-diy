import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverLayoutBuilderPage extends StatelessWidget {
  const SliverLayoutBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _color = Colors.green;
    return Scaffold(
      appBar: AppBar(
        title: Text('SliverLayoutBuilder'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return SliverLayoutBuilder(
                builder: (BuildContext context, SliverConstraints constraints) {
              debugPrint('SliverConstraints  = $constraints');
              if (constraints.userScrollDirection == ScrollDirection.forward) {
                _color = Colors.blue;
              } else if (constraints.userScrollDirection ==
                  ScrollDirection.idle) {
                _color = Colors.green;
              } else {
                _color = Colors.cyan;
              }

              return SliverToBoxAdapter(
                child: Container(
                  height: 100,
                  color: _color,
                ),
              );
            });
          }),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  child: Container(
                    height: 50,
                    color: Colors.primaries[(index % Colors.primaries.length)],
                  ),
                );
              },
              childCount: 80,
            ),
          ),
        ],
      ),
    );
  }
}
