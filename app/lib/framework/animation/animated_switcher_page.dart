import 'package:flutter/material.dart';

import '../../custom/app_slide_transitionx.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  const AnimatedSwitcherPage({Key? key}) : super(key: key);

  @override
  _AnimatedSwitcherPageState createState() =>
      _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage>
    with SingleTickerProviderStateMixin {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                // // 执行缩放动画
                // return ScaleTransition(scale: animation, child: child);

                // var tween = Tween<Offset>(
                //   begin: Offset(1, 0),
                //   end: Offset(0, 0),
                // );
                // return MySlideTransition(
                //   position: tween.animate(animation),
                //   child: child,
                // );

                return AppSlideTransitionX(
                  position: animation,
                  direction: AxisDirection.down,
                  child: child,
                );
              },
              child: Text(
                _count.toString(),
                // 显示指定key,不同的key会被认为是不同的Text,这样才能执行动画
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: const Text('+1'),
            ),
          ],
        ),
      ),
    );
  }
}

class MySlideTransition extends AnimatedWidget {
  MySlideTransition({
    Key? key,
    required Animation<Offset> position,
    this.transformHitTest = true,
    this.child,
  }) : super(key: key, listenable: position);

  Animation<Offset> get position => listenable as Animation<Offset>;
  final bool transformHitTest;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    // 动画反向执行时，调整x偏移，实现"从左边滑动隐藏"
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTest,
      child: child,
    );
  }
}
