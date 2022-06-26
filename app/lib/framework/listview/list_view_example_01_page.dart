import 'package:flutter/material.dart';

class ListViewExample01Page extends StatelessWidget {
  const ListViewExample01Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        itemExtent: 100,
        children:
            Colors.primaries.asMap().entries.map((MapEntry<int, Color> mapEntry) {
          return Container(
            color: mapEntry.value,
            alignment: Alignment.center,
            child: Text(
              mapEntry.key.toString(),
              style: TextStyle(
                fontSize: 21,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
