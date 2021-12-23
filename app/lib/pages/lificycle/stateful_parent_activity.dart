import 'dart:math';

import 'package:app/pages/lificycle/stateful_child_activity.dart';
import 'package:flutter/material.dart';

class StatefulParentActivity extends StatefulWidget {
  const StatefulParentActivity({Key? key}) : super(key: key);

  @override
  _StatefulParentActivityState createState() => _StatefulParentActivityState();
}

class _StatefulParentActivityState extends State<StatefulParentActivity> {
  _StatefulParentActivityState() {
    print('有状态父页面---constructor');
  }

  int _count = 0;

  @override
  void initState() {
    super.initState();
    print('有状态父页面---initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('有状态父页面---didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    print('有状态父页面---build');
    return Scaffold(
      appBar: AppBar(
        title: Text('有状态父页面'),
      ),
      body: ParentWidget(
        child: (String content) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(content),
              ChildWidget(initValue: _count),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return StatefulChildActivity(callback: update);
                      },
                    ),
                  );
                },
                child: Text('子页面'),
              ),
              ElevatedButton(
                onPressed: update,
                child: Text('更新当前组件'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void didUpdateWidget(covariant StatefulParentActivity oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('有状态父页面---didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('有状态父页面---deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('有状态父页面---dispose');
  }

  void update() {
    _count = Random.secure().nextInt(10);
    setState(() {});
  }
}

/// -------------------------------------
///  -------------父组件-----------------
/// -------------------------------------
class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key, required this.child}) : super(key: key);
  final Widget Function(String content) child;

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  String _content = '更新父组件';

  @override
  void initState() {
    super.initState();
    //初始化状态
    print("父组件---initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("父组件---didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("父组件---build");
    return Container(
      child: Stack(
        children: <Widget>[
          widget.child.call(_content),
          Align(
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _content = '父组件更新了';
                });
              },
              child: Text(_content),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant ParentWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("父组件---didUpdateWidget ");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("父组件---deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("父组件---dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("父组件---reassemble");
  }
}

/// -------------------------------------
///  -------------子组件-----------------
/// -------------------------------------
class ChildWidget extends StatefulWidget {
  const ChildWidget({Key? key, this.initValue = 0});

  final int initValue;

  @override
  _ChildWidgetState createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.initValue;
    print("子组件---initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("子组件---didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("子组件---build");
    return Center(
      child: ElevatedButton(
        child: Text('$_counter，更新子组件'),
        //点击后计数器自增
        onPressed: () => setState(
          () => ++_counter,
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(ChildWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _counter = widget.initValue;
    print("子组件---didUpdateWidget ");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("子组件---deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("子组件---dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("子组件---reassemble");
  }
}
