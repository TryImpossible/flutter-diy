import 'package:flutter/material.dart';

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final _animation = listenable as Animation<double>;
    return Center(
      child: Image.asset(
        "assets/images/lufei.jpeg",
        width: _animation.value,
        height: _animation.value,
      ),
    );
  }
}

class ScaleAnimation02Page extends StatefulWidget {
  const ScaleAnimation02Page({Key? key}) : super(key: key);

  @override
  _ScaleAnimation02PageState createState() =>
      _ScaleAnimation02PageState();
}

class _ScaleAnimation02PageState extends State<ScaleAnimation02Page>
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
    _animation = Tween(begin: 0.0, end: 300.0).animate(_controller);
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
      body: AnimatedImage(animation: _animation),
    );
  }
}
