import 'package:app/pages/animation/animated_decorated_box1_activity.dart';
import 'package:app/pages/animation/animated_switcher_activity.dart';
import 'package:app/pages/animation/animated_widgets_activity.dart';
import 'package:app/pages/animation/fade_route.dart';
import 'package:app/pages/animation/hero_animation_activity.dart';
import 'package:app/pages/animation/route_animation_activity.dart';
import 'package:app/pages/animation/scale_animation_01_activity.dart';
import 'package:app/pages/animation/scale_animation_02_activity.dart';
import 'package:app/pages/animation/scale_animation_03_activity.dart';
import 'package:app/pages/animation/stagger_animation_activity.dart';
import 'package:app/pages/animation/tween_animation_builder_activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationActivity extends StatefulWidget {
  const AnimationActivity({Key? key}) : super(key: key);

  @override
  _AnimationActivityState createState() => _AnimationActivityState();
}

class _AnimationActivityState extends State<AnimationActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ScaleAnimation01Activity();
                    },
                  ));
                },
                child: Text('图片放大动画示例01'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ScaleAnimation02Activity();
                    },
                  ));
                },
                child: Text('图片放大动画示例02'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ScaleAnimation03Activity();
                    },
                  ));
                },
                child: Text('图片放大动画示例03'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return RouteAnimationActivity();
                    },
                  ));
                },
                child: Text('路由动画示例01'),
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
                          child: RouteAnimationActivity(),
                        );
                      },
                    ),
                  );
                },
                child: Text('路由动画示例02'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    FadeRoute(builder: (BuildContext context) {
                      return RouteAnimationActivity();
                    }),
                  );
                },
                child: Text('路由动画示例03'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return HeroAnimationActivity();
                    },
                  ));
                },
                child: Text('Hero动画'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return StaggerAnimationActivity();
                    },
                  ));
                },
                child: Text('Stagger交织动画'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return AnimatedSwitcherActivity();
                    },
                  ));
                },
                child: Text('AnimatedSwitcher动画切换组件'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return AnimatedDecoratedBox1Activity();
                    },
                  ));
                },
                child: Text('AnimatedDecorateBox1组件'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return AnimatedWidgetsActivity();
                    },
                  ));
                },
                child: Text('Flutter预置的动画过渡组件'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return TweenAnimationBuilderActivity();
                    },
                  ));
                },
                child: Text('TweenAnimationBuilder组件'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
