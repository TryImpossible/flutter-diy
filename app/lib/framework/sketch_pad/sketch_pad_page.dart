import 'package:flutter/material.dart';

import 'sketch_pad_example_01.dart';
import 'sketch_pad_example_02.dart';
import 'sketch_pad_example_03.dart';
import 'sketch_pad_example_04.dart';
import 'sketch_pad_example_05.dart';
import 'sketch_pad_example_06.dart';
import 'sketch_pad_example_07.dart';

class SketchPadPage extends StatelessWidget {
  const SketchPadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SketchPad'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(text: '示例1'),
              Tab(text: '示例2'),
              Tab(text: '示例3'),
              Tab(text: '示例4'),
              Tab(text: '示例5'),
              Tab(text: '示例6'),
              Tab(text: '示例7'),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            SketchPadExample01(),
            SketchPadExample02(),
            SketchPadExample03(),
            SketchPadExample04(),
            SketchPadExample05(),
            SketchPadExample06(),
            SketchPadExample07(),
          ],
        ),
      ),
    );
  }
}
