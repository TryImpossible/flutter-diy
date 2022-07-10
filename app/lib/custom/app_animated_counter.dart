import 'package:flutter/material.dart';

enum AppAnimatedCounterSymbol {
  /// 不显示
  none,

  /// 仅显示加号
  plus,

  /// 仅显示减号
  minus,

  /// 显示加号和减号
  all,
}

class AppAnimatedCounter extends StatelessWidget {
  const AppAnimatedCounter({
    Key? key,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.linear,
    this.symbol = AppAnimatedCounterSymbol.all,
    required this.value,
    this.textStyle = const TextStyle(fontSize: 16),
    this.prefix,
    this.suffix,
  }) : super(key: key);
  final Duration duration;
  final Curve curve;
  final AppAnimatedCounterSymbol symbol;
  final num value;
  final TextStyle textStyle;
  final String? prefix;
  final String? suffix;

  @override
  Widget build(BuildContext context) {
    final style = DefaultTextStyle.of(context).style.merge(textStyle);
    final List<Widget> widgets = <Widget>[];
    if (prefix != null) {
      widgets.add(Text(prefix!));
    }
    widgets.add(_AnimatedSymbol(
      curve: curve,
      duration: duration,
      symbol: symbol,
      value: value,
    ));
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: '8', style: style),
      textDirection: TextDirection.ltr,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textAlign: TextAlign.center,
    )..layout();
    for (final String item in value.toString().split('')) {
      if (RegExp(r'\d').hasMatch(item)) {
        widgets.add(_AnimatedNumeral(
          curve: curve,
          duration: duration,
          value: int.tryParse(item) ?? 0,
          size: textPainter.size,
        ));
      }
      if (RegExp(r'\.').hasMatch(item)) {
        widgets.add(_DecimalPoint());
      }
    }
    if (suffix != null) {
      widgets.add(Text(suffix!));
    }
    return DefaultTextStyle.merge(
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      ),
    );
  }
}

/// 符号
class _AnimatedSymbol extends StatelessWidget {
  const _AnimatedSymbol({
    Key? key,
    required this.duration,
    required this.curve,
    required this.symbol,
    required this.value,
  }) : super(key: key);
  final Duration duration;
  final Curve curve;
  final AppAnimatedCounterSymbol symbol;
  final num value;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: symbol != AppAnimatedCounterSymbol.none,
      child: TweenAnimationBuilder(
        curve: curve,
        duration: duration,
        tween: Tween<double>(begin: 0.0, end: value == 0 ? 0.0 : 1.0),
        builder: (BuildContext context, double value, Widget? child) {
          String text = '';
          if (this.value == 0) {
            text = ' '; // 等于0，显示一个空格字符串
          }
          if (<AppAnimatedCounterSymbol>[
                AppAnimatedCounterSymbol.plus,
                AppAnimatedCounterSymbol.all,
              ].contains(symbol) &&
              this.value > 0) {
            text = '+'; // 大于0，显示 +
          }
          if (<AppAnimatedCounterSymbol>[
                AppAnimatedCounterSymbol.minus,
                AppAnimatedCounterSymbol.all,
              ].contains(symbol) &&
              this.value < 0) {
            text = '-'; // 小于0，显示 -
          }
          return Center(
            widthFactor: value,
            child: AnimatedOpacity(
              duration: Duration.zero,
              opacity: value.clamp(0, 1),
              child: Text(text),
            ),
          );
        },
      ),
    );
  }
}

/// 小数点
class _DecimalPoint extends StatelessWidget {
  const _DecimalPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('.', textAlign: TextAlign.center);
  }
}

/// 数字
class _AnimatedNumeral extends StatelessWidget {
  const _AnimatedNumeral({
    Key? key,
    required this.duration,
    required this.curve,
    required this.value,
    required this.size,
  }) : super(key: key);
  final Duration duration;
  final Curve curve;
  final int value;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: curve,
      duration: duration,
      tween: Tween<double>(begin: 0.0, end: value.toDouble()),
      builder: (BuildContext context, double value, Widget? child) {
        // 整数部分
        final int integer = value ~/ 1;
        // 小数部分
        final double decimal = (value - integer).abs();
        // debugPrint('whole is $integer, decimal is $decimal');
        return SizedBox.fromSize(
          size: size,
          child: Stack(
            children: <Widget>[
              _buildSingleNumeral(
                offset: size.height * decimal, // 0 -> -size.height
                opacity: 1 - decimal, // 1.0 -> 0.0
                digit: integer,
              ),
              _buildSingleNumeral(
                offset: size.height * (decimal - 1), // size.height -> 0
                opacity: decimal, // 0.0 -> 0.1
                digit: integer + 1,
              ),
            ],
          ),
        );
      },
    );
  }

  /// 每个数字
  Widget _buildSingleNumeral({
    required double offset,
    required double opacity,
    required int digit,
  }) {
    return Positioned(
      top: offset,
      child: AnimatedOpacity(
        duration: Duration.zero,
        opacity: opacity.clamp(0, 1),
        child: Text(
          '$digit',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
