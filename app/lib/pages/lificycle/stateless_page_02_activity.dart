import 'package:flutter/material.dart';

class StatelessPage02Activity extends StatelessWidget {
  StatelessPage02Activity({Key? key}) : super(key: key) {
    print('无状态子页面---constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('无状态子页面---build');
    return Scaffold(
      appBar: AppBar(
        title: Text('无状态子页面'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return
                //     },
                //   ),
                // );
              },
              child: Text('触发父级页面更新'),
            ),
          ],
        ),
      ),
    );
  }
}
