import 'package:flutter/material.dart';

class ListViewExample04Page extends StatefulWidget {
  const ListViewExample04Page({Key? key}) : super(key: key);

  @override
  _ListViewExample04PageState createState() =>
      _ListViewExample04PageState();
}

class _ListViewExample04PageState extends State<ListViewExample04Page> {
  Future _onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: new Text('当前已是最新数据!'),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemExtent: 100,
          itemCount: Colors.primaries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.primaries[index],
              alignment: Alignment.center,
              child: Text(
                index.toString(),
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
