import 'package:flutter/material.dart';

import 'circular_progress.dart';
import 'dashboard_progress.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> tabs = <String, Widget>{
      'CircularProgress': const _CircularProgressExample(),
      'DashboardProgress': const _DashboardProgressExample(),
    };
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Paint'),
          bottom: TabBar(
            isScrollable: true,
            tabs: tabs.keys.map((String title) {
              return Tab(text: title);
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: tabs.values.map((Widget widget) {
            return Center(child: widget);
          }).toList(),
        ),
      ),
    );
  }
}

class _CircularProgressExample extends StatelessWidget {
  const _CircularProgressExample({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return ColoredBox(
      color: Colors.grey.shade300,
      child: CircularProgress(size: Size.square(width)),
    );
  }
}

class _DashboardProgressExample extends StatelessWidget {
  const _DashboardProgressExample({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return const ColoredBox(
      color: Colors.white,
      child: DashboardProgress(),
    );
  }
}
