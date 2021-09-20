import 'package:app/global.dart';
import 'package:flutter/material.dart';

class ListViewExample02Fragment extends StatelessWidget {
  const ListViewExample02Fragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemExtent: 100,
        itemCount: colorList.length,
        reverse: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: colorList[index],
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
    );
  }
}
