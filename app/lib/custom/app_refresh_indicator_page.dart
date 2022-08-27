import 'package:flutter/material.dart' hide RefreshIndicatorTriggerMode;

import 'app_refresh_indicator.dart';

class AppRefreshIndicatorPage extends StatefulWidget {
  const AppRefreshIndicatorPage({Key? key}) : super(key: key);

  @override
  State<AppRefreshIndicatorPage> createState() =>
      _AppRefreshIndicatorPageState();
}

class _AppRefreshIndicatorPageState extends State<AppRefreshIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppRefreshIndicator控件'),
      ),
      body: AppRefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: 30,
          itemExtent: 120,
          itemBuilder: (_, int index) {
            return ColoredBox(
              color: Colors.primaries[index % Colors.primaries.length],
            );
          },
        ),
      ),
    );
  }
}
