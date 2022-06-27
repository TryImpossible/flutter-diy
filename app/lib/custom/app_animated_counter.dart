import 'package:flutter/material.dart';

class AppAnimatedCounter extends StatelessWidget {
  const AppAnimatedCounter({
    Key? key,
    required this.duration,
    required this.value,
  }) : super(key: key);
  final Duration duration;
  final int value;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.red,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          debugPrint('constraints is $constraints');
          return TweenAnimationBuilder(
            tween: Tween(end: value.toDouble()),
            duration: duration,
            builder: (BuildContext context, double value, Widget? child) {
              // 整数部分
              final int whole = value ~/ 1;
              // 小数部分
              final double decimal = (value - whole).abs();
              debugPrint('whole is $whole, decimal is $decimal');
              return Stack(
                children: <Widget>[
                  Positioned(
                    // 0 -> -constraints.maxHeight
                    top: -constraints.maxHeight * decimal,
                    child: AnimatedOpacity(
                      duration: Duration.zero,
                      opacity: 1 - decimal, // 1.0 -> 0.0
                      child: Text(
                        '$whole',
                        style: TextStyle(fontSize: 100),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Positioned(
                    // constraints.maxHeight -> 0
                    top: constraints.maxHeight * (1 - decimal),
                    child: AnimatedOpacity(
                      duration: Duration.zero,
                      opacity: decimal, // 0.0 -> 0.1
                      child: Text(
                        '${whole + 1}',
                        style: TextStyle(fontSize: 100),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
