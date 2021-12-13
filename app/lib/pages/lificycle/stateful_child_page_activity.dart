import 'package:flutter/material.dart';

class StatefulChildPageActivity extends StatefulWidget {
  const StatefulChildPageActivity({
    Key? key,
    this.callback,
  }) : super(key: key);
  final VoidCallback? callback;

  @override
  _StatefulChildPageActivityState createState() =>
      _StatefulChildPageActivityState();
}

class _StatefulChildPageActivityState extends State<StatefulChildPageActivity> {
  _StatefulChildPageActivityState() {
    print('有状态子组件---constructor');
  }

  @override
  void initState() {
    super.initState();
    print('有状态子组件---initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('有状态子组件---didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    print('有状态子组件---build');
    return Scaffold(
      appBar: AppBar(
        title: Text('父组件'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                widget.callback?.call();
              },
              child: Text('更新父组件'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text('更新当前组件'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant StatefulChildPageActivity oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('有状态子组件---didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('有状态子组件---deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('有状态子组件---dispose');
  }
}
