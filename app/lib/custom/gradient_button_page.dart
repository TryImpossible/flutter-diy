import 'package:flutter/material.dart';

class _GradientButton extends StatelessWidget {
  const _GradientButton({
    Key? key,
    this.colors,
    this.width,
    this.height,
    this.borderRadius,
    this.onPressed,
    required this.child,
  }) : super(key: key);

  /// 渐变颜色组
  final List<Color>? colors;

  /// 宽高
  final double? width;
  final double? height;

  final Widget child;
  final BorderRadius? borderRadius;

  /// 点击回调
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    //确保colors数组不空
    List<Color> _colors =
        colors ?? [theme.primaryColor, theme.primaryColorDark];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: width, height: height),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GradientButtonPage extends StatelessWidget {
  const GradientButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          _GradientButton(
            colors: [Colors.orange, Colors.red],
            height: 50.0,
            child: Text("Submit"),
            onPressed: onTap,
          ),
          _GradientButton(
            height: 50.0,
            colors: [Colors.lightGreen, Colors.green.shade700],
            child: Text("Submit"),
            onPressed: onTap,
          ),
          _GradientButton(
            height: 50.0,
            colors: [Colors.lightBlue.shade300, Colors.blueAccent],
            child: Text("Submit"),
            onPressed: onTap,
          ),
        ],
      ),
    );
  }

  onTap() {
    print("button click");
  }
}
