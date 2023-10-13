import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HitTestBehaviorPage extends StatefulWidget {
  const HitTestBehaviorPage({super.key});

  @override
  State<HitTestBehaviorPage> createState() => _HitTestBehaviorPageState();
}

class _HitTestBehaviorPageState extends State<HitTestBehaviorPage> {
  HitTestBehavior _behavior = HitTestBehavior.opaque;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HitTestBehavior'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('$_behavior'),
            const SizedBox(height: 32),
            const Text(r'''
            /// 默认情况下点击组件behavior是HitTestBehavior.deferToChild根据点击组件子节点命中测试要求而定
            /// 当为HitTestBehavior.opaque情况下，点击事件由最上层子节点响应
            /// 当为HitTestBehavior.translucent情况下，点击事件都透传所有子节点都响应
            /// 当为HitTestBehavior.deferToChild情况下,点击事件无响应（因为自定义_ColoredBoxWithNoHitTest忽略了命中测试）
            '''),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Listener(
                  behavior: _behavior,
                  onPointerDown: (_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('onPointerDown -> Listener -> 外'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  },
                  child: _ColoredBoxWithNoHitTest(
                    color: Colors.red.withOpacity(0.3),
                    child: const SizedBox(width: 250, height: 200),
                  ),
                ),
                Listener(
                  behavior: _behavior,
                  onPointerDown: (_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('onPointerDown -> Listener -> 内'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  },
                  child: _ColoredBoxWithNoHitTest(
                    color: Colors.red.withOpacity(0.5),
                    child: const SizedBox(width: 150, height: 100),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: HitTestBehavior.values.map((behavior) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _behavior = behavior;
                    });
                  },
                  child: Text(
                    behavior.toString().replaceAll('HitTestBehavior.', ''),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}

/// A widget that paints its area with a specified [Color] and then draws its
/// child on top of that color.
class _ColoredBoxWithNoHitTest extends SingleChildRenderObjectWidget {
  /// Creates a widget that paints its area with the specified [Color].
  ///
  /// The [color] parameter must not be null.
  const _ColoredBoxWithNoHitTest({required this.color, super.child, super.key});

  /// The color to paint the background area with.
  final Color color;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderColoredBoxWithNoHitTest(color: color);
  }

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    (renderObject as _RenderColoredBoxWithNoHitTest).color = color;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Color>('color', color));
  }
}

class _RenderColoredBoxWithNoHitTest extends RenderProxyBox {
  _RenderColoredBoxWithNoHitTest({required Color color}) : _color = color;

  /// The fill color for this render object.
  ///
  /// This parameter must not be null.
  Color get color => _color;
  Color _color;

  set color(Color value) {
    if (value == _color) {
      return;
    }
    _color = value;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // It's tempting to want to optimize out this `drawRect()` call if the
    // color is transparent (alpha==0), but doing so would be incorrect. See
    // https://github.com/flutter/flutter/pull/72526#issuecomment-749185938 for
    // a good description of why.
    if (size > Size.zero) {
      context.canvas.drawRect(offset & size, Paint()..color = color);
    }
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    return false;
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return false;
  }
}
