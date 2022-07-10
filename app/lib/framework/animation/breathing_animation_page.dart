import 'package:flutter/material.dart';

class BreathingAnimationPage extends StatefulWidget {
  const BreathingAnimationPage({Key? key}) : super(key: key);

  @override
  State<BreathingAnimationPage> createState() => _BreathingAnimationPageState();
}

class _BreathingAnimationPageState extends State<BreathingAnimationPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _opacityController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _opacityController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final Animation animation1 = Tween(begin: 0.0, end: 1.0)
    //     .chain(CurveTween(curve: Interval(0.0, 0.2)))
    //     .animate(_controller);
    // final Animation animation3 = Tween(begin: 1.0, end: 0.0)
    //     .chain(CurveTween(curve: Interval(0.4, 0.95)))
    //     .animate(_controller);
    return Scaffold(
      appBar: AppBar(title: Text('BreathingAnimation')),
      body: Center(
        child: FadeTransition(
          opacity: Tween(begin: 0.5, end: 1.0).animate(_opacityController),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  gradient: RadialGradient(
                    colors: <Color>[Colors.blue.shade600, Colors.blue.shade100],
                    stops: <double>[_controller.value, _controller.value + 0.1],
                    // stops: _controller.value <= 0.2
                    //     ? <double>[animation1.value, animation1.value + 0.1]
                    //     : <double>[animation3.value, animation3.value + 0.1],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _controller.duration = Duration(seconds: 4);
          _controller.forward();
          await Future.delayed(const Duration(seconds: 4));

          _opacityController.duration = Duration(microseconds: 1750);
          _opacityController.repeat(reverse: true);
          await Future.delayed(const Duration(seconds: 7));
          _opacityController.reset();

          _controller.duration = Duration(seconds: 8);
          _controller.reverse();
        },
        child: Icon(Icons.add),
        heroTag: "BreathingAnimationPage",
      ),
    );
  }
}
