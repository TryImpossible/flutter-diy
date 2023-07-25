import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PhysicsAnimationPage extends StatefulWidget {
  const PhysicsAnimationPage({super.key});

  @override
  State<PhysicsAnimationPage> createState() => _PhysicsAnimationPageState();
}

class _PhysicsAnimationPageState extends State<PhysicsAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(milliseconds: 600), () {
            _controller.reset();
          });
        }
      });

    _animation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Physics Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                print('value: ${_controller.value}, ${_animation.value}');
                return ScaleTransition(
                  scale: _animation,
                  child: child,
                );
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    final Simulation simulation = SpringSimulation(
                      const SpringDescription(
                        mass: 1.0, // 质量
                        stiffness: 100.0, // 弹簧刚度
                        damping: 10.0, // 阻尼
                      ),
                      0.0, // 起始位置
                      100.0, // 结束位置
                      0.0, // 起始速度
                    );
                    _controller.animateWith(simulation);
                  },
                  child: const Text('弹簧'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final Simulation simulation = FrictionSimulation(
                      0.1, // 阻力系数
                      100.0, // 起始位置
                      0.0, // 起始速度
                    );
                    _controller.animateWith(simulation);
                  },
                  child: const Text('摩擦'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final Simulation simulation = GravitySimulation(
                      9.8, // 重力加速度
                      0.0, // 起始位置
                      100.0, // 结束位置
                      0.0, // 起始速度
                    );
                    _controller.animateWith(simulation);
                  },
                  child: const Text('重力感应'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
