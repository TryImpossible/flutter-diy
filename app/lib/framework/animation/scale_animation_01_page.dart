import 'package:flutter/material.dart';

class ScaleAnimation01Page extends StatefulWidget {
  const ScaleAnimation01Page({Key? key}) : super(key: key);

  @override
  State<ScaleAnimation01Page> createState() => _ScaleAnimation01PageState();
}

class _ScaleAnimation01PageState extends State<ScaleAnimation01Page>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceIn);
    // 匀速
    // 图片宽高从0谈到300
    _animation = Tween(begin: 0.0, end: 300.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.asset(
          "assets/images/lufei.jpeg",
          width: _animation.value,
          height: _animation.value,
        ),
      ),
    );
  }
}
