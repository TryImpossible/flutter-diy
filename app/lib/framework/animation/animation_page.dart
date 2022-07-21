import 'package:app/framework/animation/breathing_animation_page.dart';
import 'package:app/framework/animation/scanner_sweep_page.dart';
import 'package:app/framework/animation/snow_animation_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../custom/app_fade_route.dart';
import 'animated_decorated_box1_page.dart';
import 'animated_switcher_page.dart';
import 'animated_widgets_page.dart';
import 'hero_animation_page.dart';
import 'route_animation_page.dart';
import 'scale_animation_01_page.dart';
import 'scale_animation_02_page.dart';
import 'scale_animation_03_page.dart';
import 'stagger_animation_page.dart';
import 'tween_animation_builder_page.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ScaleAnimation01Page();
                    },
                  ));
                },
                child: const Text('图片放大动画示例01'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ScaleAnimation02Page();
                    },
                  ));
                },
                child: const Text('图片放大动画示例02'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ScaleAnimation03Page();
                    },
                  ));
                },
                child: const Text('图片放大动画示例03'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return const RouteAnimationPage();
                    },
                  ));
                },
                child: const Text('路由动画示例01'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (
                        BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                      ) {
                        return FadeTransition(
                          opacity: animation,
                          child: const RouteAnimationPage(),
                        );
                      },
                    ),
                  );
                },
                child: const Text('路由动画示例02'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    AppFadeRoute(builder: (BuildContext context) {
                      return const RouteAnimationPage();
                    }),
                  );
                },
                child: const Text('路由动画示例03'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const HeroAnimationPage();
                    },
                  ));
                },
                child: const Text('Hero动画'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const StaggerAnimationPage();
                    },
                  ));
                },
                child: const Text('Stagger交织动画'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const AnimatedSwitcherPage();
                    },
                  ));
                },
                child: const Text('AnimatedSwitcher动画切换组件'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const AnimatedDecoratedBox1Page();
                    },
                  ));
                },
                child: const Text('AnimatedDecorateBox1组件'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const AnimatedWidgetsPage();
                    },
                  ));
                },
                child: const Text('Flutter预置的动画过渡组件'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return TweenAnimationBuilderPage();
                    },
                  ));
                },
                child: const Text('TweenAnimationBuilder组件'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const BreathingAnimationPage();
                    },
                  ));
                },
                child: const Text('BreathingAnimation'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const SnowAnimationPage();
                    },
                  ));
                },
                child: const Text('SnowAnimation'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ScannerSweepPage();
                    },
                  ));
                },
                child: const Text('ScannerSweepAnimation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
