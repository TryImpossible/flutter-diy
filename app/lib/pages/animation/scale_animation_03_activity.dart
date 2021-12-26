import 'package:flutter/material.dart';

class ScaleAnimation03Activity extends StatefulWidget {
  const ScaleAnimation03Activity({Key? key}) : super(key: key);

  @override
  _ScaleAnimation03ActivityState createState() =>
      _ScaleAnimation03ActivityState();
}

class _ScaleAnimation03ActivityState extends State<ScaleAnimation03Activity>
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
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 动画执行结束时反向执行动画
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // 动画恢复到初始状态很行动画（正向）
        _controller.forward();
      }
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
        child: AnimatedBuilder(
          animation: _animation,
          child: Image.asset("assets/images/lufei.jpeg"),
          builder: (BuildContext context, Widget? child) {
            return Container(
              width: _animation.value,
              height: _animation.value,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
