import 'package:flutter/material.dart';

class GridViewExample03Page extends StatelessWidget {
  const GridViewExample03Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children:
            Colors.primaries.asMap().entries.map((MapEntry<int, Color> mapEntry) {
          return Container(
            alignment: Alignment.center,
            color: Colors.primaries[mapEntry.key],
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
