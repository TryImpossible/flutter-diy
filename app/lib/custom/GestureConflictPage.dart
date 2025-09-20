import 'package:flutter/material.dart';

class GestureConflictPage extends StatefulWidget {
  const GestureConflictPage({super.key});

  @override
  State<GestureConflictPage> createState() => _GestureConflictPageState();
}

class _GestureConflictPageState extends State<GestureConflictPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('手势冲突')),
      body: ListView.builder(
        controller: _controller,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == 3) {
            return SizedBox(
              height: 300,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: _ChildScrollPhysics(_controller),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    color: Colors.blue,
                    margin: const EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                    child: Text('内层ListItem', style: TextStyle(fontSize: 20)),
                  );
                },
                itemCount: 10,
              ),
            );
          }
          return Container(
            height: 100,
            color: Colors.red,
            margin: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.center,
            child: Text('外层ListItem'),
          );
        },
      ),
    );
  }
}

class _ChildScrollPhysics extends ScrollPhysics {
  final ScrollController controller;
  const _ChildScrollPhysics(this.controller, {super.parent});

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    var isReach =
        ((position.pixels <= position.minScrollExtent && offset > 0) || // 到达顶部
        (position.pixels >= position.maxScrollExtent && offset < 0) // 到达底部
        );
    if (isReach) {
      controller.jumpTo(controller.position.pixels - offset);
      return 0;
    } else {
      return offset;
    }
  }

  @override
  _ChildScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return _ChildScrollPhysics(controller, parent: buildParent(ancestor));
  }
}
