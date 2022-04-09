import 'package:flutter/material.dart';

class ListenerActivity extends StatefulWidget {
  const ListenerActivity({Key? key}) : super(key: key);

  @override
  _ListenerActivityState createState() => _ListenerActivityState();
}

class _ListenerActivityState extends State<ListenerActivity> {
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listener组件'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('指针坐标', textScaleFactor: 1.5),
              ),
              Listener(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: 300.0,
                  height: 150.0,
                  child: Text(
                    '相对于屏幕的坐标：${_event?.position ?? ''}\n'
                    '相对于父级的坐标：${_event?.localPosition ?? ''}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPointerDown: (PointerDownEvent event) =>
                    setState(() => _event = event),
                onPointerMove: (PointerMoveEvent event) =>
                    setState(() => _event = event),
                onPointerUp: (PointerUpEvent event) =>
                    setState(() => _event = event),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('忽略指针事件', textScaleFactor: 1.5),
              ),
              Listener(
                child: IgnorePointer(
                  child: Listener(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      width: 300.0,
                      height: 150.0,
                      child: Text(
                        'IgnorePointer阻止子树接收指针事件，且本身不会参与命中测试',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPointerDown: (PointerDownEvent event) => print('in'),
                  ),
                ),
                onPointerDown: (PointerDownEvent event) => print('up'),
              ),
              SizedBox(height: 32.0),
              Listener(
                child: AbsorbPointer(
                  child: Listener(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.red.shade300,
                      width: 300.0,
                      height: 150.0,
                      child: Text(
                        'AbsorbPointer阻止子树接收指针事件，且本身参与命中测试',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPointerDown: (PointerDownEvent event) => print('in'),
                  ),
                ),
                onPointerDown: (PointerDownEvent event) => print('up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
