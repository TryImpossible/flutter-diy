import 'dart:math';

import 'package:flutter/material.dart';

import 'stateful_child_page.dart';

class StatefulParentPage extends StatefulWidget {
  const StatefulParentPage({Key? key}) : super(key: key);

  @override
  State<StatefulParentPage> createState() => _StatefulParentPageState();
}

class _StatefulParentPageState extends State<StatefulParentPage> {
  _StatefulParentPageState() {
    debugPrint('有状态父页面---constructor');
  }

  int _count = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('有状态父页面---initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('有状态父页面---didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('有状态父页面---build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('有状态父页面'),
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
                        return StatefulChildPage(callback: update);
                      },
                    ),
                  );
                },
                child: const Text('子页面'),
              ),
              ElevatedButton(
                onPressed: update,
                child: const Text('更新当前组件'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void didUpdateWidget(covariant StatefulParentPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('有状态父页面---didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint('有状态父页面---deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint('有状态父页面---dispose');
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
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  String _content = '更新父组件';

  @override
  void initState() {
    super.initState();
    //初始化状态
    debugPrint("父组件---initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("父组件---didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("父组件---build");
    return Stack(
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
    );
  }

  @override
  void didUpdateWidget(covariant ParentWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("父组件---didUpdateWidget ");
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint("父组件---deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("父组件---dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    debugPrint("父组件---reassemble");
  }
}

/// -------------------------------------
///  -------------子组件-----------------
/// -------------------------------------
class ChildWidget extends StatefulWidget {
  const ChildWidget({Key? key, this.initValue = 0}) : super(key: key);

  final int initValue;

  @override
  State<ChildWidget> createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.initValue;
    debugPrint("子组件---initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("子组件---didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("子组件---build");
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
    debugPrint("子组件---didUpdateWidget ");
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint("子组件---deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("子组件---dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    debugPrint("子组件---reassemble");
  }
}
