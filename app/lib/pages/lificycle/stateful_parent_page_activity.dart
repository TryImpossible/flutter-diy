import 'package:app/pages/lificycle/stateful_child_page_activity.dart';
import 'package:flutter/material.dart';

class StatefulParentPageActivity extends StatefulWidget {
  const StatefulParentPageActivity({Key? key}) : super(key: key);

  @override
  _StatefulParentPageActivityState createState() =>
      _StatefulParentPageActivityState();
}

class _StatefulParentPageActivityState
    extends State<StatefulParentPageActivity> {
  _StatefulParentPageActivityState() {
    print('有状态父组件---constructor');
  }

  @override
  void initState() {
    super.initState();
    print('有状态父组件---initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('有状态父组件---didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    print('有状态父组件---build');
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return StatefulChildPageActivity(callback: update);
                    },
                  ),
                );
              },
              child: Text('子组件'),
            ),
            ElevatedButton(
              onPressed: update,
              child: Text('更新当前组件'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant StatefulParentPageActivity oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('有状态父组件---didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('有状态父组件---deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('有状态父组件---dispose');
  }

  void update() {
    setState(() {});
  }
}
