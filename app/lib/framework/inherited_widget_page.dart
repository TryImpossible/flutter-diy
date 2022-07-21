import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  const ShareDataWidget({Key? key, required this.data, required Widget child})
      : super(key: key, child: child);

  /// 需要在子树中共享的数据，保存点击次数
  final int data;

  /// 定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget? of(BuildContext context) {
    // return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
    return context
        .getElementForInheritedWidgetOfExactType<ShareDataWidget>()!
        .widget as ShareDataWidget;
  }

  /// 该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return (oldWidget as ShareDataWidget).data != data;
  }
}

class _TestWidget extends StatefulWidget {
  const _TestWidget({Key? key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /// 父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用
    /// 如果 build 中没有依赖InheritedWidget, 则此回调不会被调用
    debugPrint('Dependencies change');
  }

  @override
  void didUpdateWidget(covariant _TestWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    debugPrint('didUpdateWidget change');
  }

  @override
  Widget build(BuildContext context) {
    /// 使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context)!.data.toString());
  }
}

class InheritedWidgetPage extends StatefulWidget {
  const InheritedWidgetPage({Key? key}) : super(key: key);

  @override
  State<InheritedWidgetPage> createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget'),
      ),
      body: Center(
        child: ShareDataWidget(
          data: _count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: _TestWidget(),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ++_count;
                  });
                },
                child: const Text('Increment'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
