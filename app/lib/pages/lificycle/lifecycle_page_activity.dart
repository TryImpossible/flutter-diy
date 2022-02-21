import 'package:app/pages/lificycle/stateful_parent_activity.dart';
import 'package:app/pages/lificycle/stateless_parent_activity.dart';
import 'package:flutter/material.dart';

class LifecyclePageActivity extends StatelessWidget {
  const LifecyclePageActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('生命周期'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return StatelessParentActivity();
                    },
                  ),
                );
              },
              child: Text('StatelessWidget(无状态)'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return StatefulParentActivity();
                    },
                  ),
                );
              },
              child: Text('StatefulWidget(有状态)'),
            ),
          ],
        ),
      ),
    );
  }
}