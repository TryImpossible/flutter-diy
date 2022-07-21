import 'package:flutter/material.dart';

import 'stateful_parent_page.dart';
import 'stateless_parent_page.dart';

class LifecyclePage extends StatelessWidget {
  const LifecyclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget生命周期'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return StatelessParentPage();
                    },
                  ),
                );
              },
              child: const Text('StatelessWidget(无状态)'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return const StatefulParentPage();
                    },
                  ),
                );
              },
              child: const Text('StatefulWidget(有状态)'),
            ),
          ],
        ),
      ),
    );
  }
}
