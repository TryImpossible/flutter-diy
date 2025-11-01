import 'package:flutter/material.dart';

class FadeInFadeOutAnimationPage extends StatefulWidget {
  const FadeInFadeOutAnimationPage({super.key});

  @override
  State<FadeInFadeOutAnimationPage> createState() =>
      _FadeInFadeOutAnimationPageState();
}

class _FadeInFadeOutAnimationPageState
    extends State<FadeInFadeOutAnimationPage> {
  bool _isShowFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isShowFirst = !_isShowFirst;
            });
          },
          child: AnimatedCrossFade(
            firstChild: Image.asset('assets/images/lufei.jpeg'),
            secondChild: Image.asset('assets/images/suolong.jpeg'),
            // firstCurve: LinearHalfCurve(),
            // secondCurve: LinearHalfCurve().flipped,
            firstCurve: Interval(0, 0.5),
            secondCurve: Interval(0.5, 1),
            crossFadeState: _isShowFirst
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Duration(seconds: 2),
          ),
        ),
      ),
    );
  }
}

class LinearHalfCurve extends Curve {
  @override
  double transformInternal(double t) {
    if (t < 0.5) {
      return t * 2; // double speed during [0, 0.5]
    }
    return 1.0; // constant 1.0 during [0.5, 1.0]
  }
}
