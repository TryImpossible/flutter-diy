import 'package:flutter/material.dart';

class StaggerAnimationPage extends StatefulWidget {
  const StaggerAnimationPage({Key? key}) : super(key: key);

  @override
  _StaggerAnimationPageState createState() =>
      _StaggerAnimationPageState();
}

class _StaggerAnimationPageState extends State<StaggerAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playAnimation() async {
    try {
      // 先正向执行动画
      await _controller.forward().orCancel;
      // 再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: _playAnimation,
              child: Text('start animation'),
            ),
            Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                border: Border.all(color: Colors.black.withOpacity(0.5)),
              ),
              child: _StaggerAnimation(controller: _controller),
            ),
          ],
        ),
      ),
    );
  }
}

class _StaggerAnimation extends StatelessWidget {
  _StaggerAnimation({
    Key? key,
    required this.controller,
  }) : super(key: key) {
    // 高度动画
    height = Tween<double>(
      begin: .0,
      end: 300.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.6, curve: Curves.ease),
    ));
    // 颜色动画
    color = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.6, curve: Curves.ease),
    ));
    // padding动画
    padding = Tween<EdgeInsets>(
      begin: EdgeInsets.only(left: .0),
      end: EdgeInsets.only(left: 100.0),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.6, 1.0, curve: Curves.ease),
    ));
  }

  final AnimationController controller;
  late final Animation<double> height;
  late final Animation<EdgeInsets> padding;
  late final Animation<Color?> color;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          alignment: Alignment.bottomCenter,
          padding: padding.value,
          child: Container(
            color: color.value,
            width: 50.0,
            height: height.value,
          ),
        );
      },
    );
  }
}
