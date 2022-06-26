import 'package:flutter/material.dart';

class StatefulChildPage extends StatefulWidget {
  const StatefulChildPage({
    Key? key,
    this.callback,
  }) : super(key: key);
  final VoidCallback? callback;

  @override
  _StatefulChildPageState createState() =>
      _StatefulChildPageState();
}

class _StatefulChildPageState extends State<StatefulChildPage> {
  _StatefulChildPageState() {
    print('有状态子页面---constructor');
  }

  @override
  void initState() {
    super.initState();
    print('有状态子页面---initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('有状态子页面---didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    print('有状态子页面---build');
    return Scaffold(
      appBar: AppBar(
        title: Text('有状态子页面'),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant StatefulChildPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('有状态子页面---didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('有状态子页面---deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('有状态子页面---dispose');
  }
}
