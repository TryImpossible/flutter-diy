import 'package:app/global.dart';
import 'package:flutter/material.dart';

class GridViewExample03Fragment extends StatelessWidget {
  const GridViewExample03Fragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children:
            colorList.asMap().entries.map((MapEntry<int, Color> mapEntry) {
          return Container(
            alignment: Alignment.center,
            color: colorList[mapEntry.key],
            child: Text(
              mapEntry.key.toString(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }).toList(),
      ),
    );
  }
}
