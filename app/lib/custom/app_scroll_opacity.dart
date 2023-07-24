import 'dart:math';

import 'package:flutter/material.dart';

class AppScrollOpacityPage extends StatefulWidget {
  const AppScrollOpacityPage({Key? key}) : super(key: key);

  @override
  State<AppScrollOpacityPage> createState() => _AppScrollOpacityPageState();
}

class _AppScrollOpacityPageState extends State<AppScrollOpacityPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppScrollOpacity(
          controller: _controller,
          builder: (BuildContext context, double opacity) {
            debugPrint('opacity: $opacity');
            return Text(
              'AppScrollOpacity控件',
              style: TextStyle(
                color: Color.lerp(Colors.white, Colors.black, opacity),
              ),
            );
          },
        ),
      ),
      body: ListView.builder(
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text('$index'),
          );
        },
      ),
    );
  }
}

typedef AppScrollOpacityBuilder = Widget Function(
    BuildContext context, double opacity);

class AppScrollOpacity extends StatefulWidget {
  const AppScrollOpacity({
    super.key,
    required this.controller,
    required this.builder,
    this.threshold = 44,
  });

  final ScrollController controller;
  final AppScrollOpacityBuilder builder;
  final double threshold;

  @override
  State<AppScrollOpacity> createState() => _AppScrollOpacityState();
}

class _AppScrollOpacityState extends State<AppScrollOpacity> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_didScroll);
  }

  void _didScroll() {
    final double opacity =
        (widget.controller.offset / widget.threshold).clamp(0.0, 1.0);
    if (opacity != _opacity) {
      setState(() {
        _opacity = opacity;
      });
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_didScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _opacity);
  }
}
