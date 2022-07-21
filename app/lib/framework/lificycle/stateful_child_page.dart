import 'package:flutter/material.dart';

class StatefulChildPage extends StatefulWidget {
  const StatefulChildPage({
    Key? key,
    this.callback,
  }) : super(key: key);
  final VoidCallback? callback;

  @override
  State<StatefulChildPage> createState() => _StatefulChildPageState();
}

class _StatefulChildPageState extends State<StatefulChildPage> {
  _StatefulChildPageState() {
    debugPrint('有状态子页面---constructor');
  }

  @override
  void initState() {
    super.initState();
    debugPrint('有状态子页面---initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('有状态子页面---didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('有状态子页面---build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('有状态子页面'),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant StatefulChildPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('有状态子页面---didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint('有状态子页面---deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint('有状态子页面---dispose');
  }
}
