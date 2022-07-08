import 'dart:math';

import 'package:flutter/material.dart';

class StatefulBuilderPage extends StatelessWidget {
  const StatefulBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _color = Colors.black;
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulBuilder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _color = Colors
                          .primaries[Random().nextInt(Colors.primaries.length)];
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: _color,
                  ),
                );
              },
            ),
            SizedBox(height: 12),
            Text('点击盒子切换颜色'),
          ],
        ),
      ),
    );
  }
}
