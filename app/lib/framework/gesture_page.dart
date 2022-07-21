import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  const GesturePage({Key? key}) : super(key: key);

  @override
  State<GesturePage> createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  /// 手势检测事件
  String _operation = 'No Gesture detected!';

  void _updateText(String text) {
    setState(() {
      _operation = text;
    });
  }

  /// 小球距顶部的偏移
  double _top = 0.0;

  /// 小球距左边的偏移
  double _left = 0.0;

  /// 通过修改图片宽度来达到绽放效果
  double _width = 200.0;

  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture控件'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('手势检测', textScaleFactor: 1.5),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: 200.0,
                  height: 100.0,
                  child: Text(
                    _operation,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                onTap: () => _updateText('Tap'), // 点击
                onDoubleTap: () => _updateText('DoubleTap'), // 双击
                onLongPress: () => _updateText('LongPress'), // 长按
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('拖动、滑动', textScaleFactor: 1.5),
              ),
              Container(
                width: double.infinity,
                height: 200.0,
                color: Colors.blue.shade50,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: _top,
                      left: _left,
                      child: GestureDetector(
                        child: const CircleAvatar(child: Text('A')),
                        // 手指按下时会触发此回调
                        onPanDown: (DragDownDetails details) {
                          // 打印手指按下的位置（相对于屏幕）
                          debugPrint('用户手指按下：${details.globalPosition}');
                        },
                        // 手指滑动时会触发此回调
                        onPanUpdate: (DragUpdateDetails details) {
                          // 用户手指滑动时，更新偏移，重新构建
                          debugPrint('用户手指滑动：$_left $_top');
                          setState(() {
                            _left += details.delta.dx;
                            _top += details.delta.dy;
                          });
                        },
                        // 手指抬起时会触发此回调
                        onPanEnd: (DragEndDetails details) {
                          //打印滑动结束时在x、y轴上的速度
                          debugPrint('用户手指抬起: ${details.velocity}');
                          setState(() {
                            _left = 0;
                            _top = 0;
                          });
                        },
                        //垂直方向拖动事件
                        onVerticalDragUpdate: (DragUpdateDetails details) {
                          setState(() {
                            _top += details.delta.dy;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('缩放', textScaleFactor: 1.5),
              ),
              GestureDetector(
                child: Image.asset("assets/images/lufei.jpeg", width: _width),
                onScaleUpdate: (ScaleUpdateDetails details) {
                  setState(() {
                    // 绽放倍数在0.8到10倍之间
                    _width = 200 * details.scale.clamp(.8, 10.0);
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('GestureRecognizer', textScaleFactor: 1.5),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: '你好世界'),
                    TextSpan(
                      text: '点我变色',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: _toggle ? Colors.blue : Colors.red,
                      ),
                      recognizer: _tapGestureRecognizer
                        ..onTap = () {
                          setState(() {
                            _toggle = !_toggle;
                          });
                        },
                    ),
                    const TextSpan(text: '你好世界'),
                  ],
                ),
              ),
              const SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
    );
  }
}
