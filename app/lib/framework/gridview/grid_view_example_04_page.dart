import 'package:flutter/material.dart';

class GridViewExample04Page extends StatelessWidget {
  const GridViewExample04Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.extent(
        padding: EdgeInsets.zero,
        maxCrossAxisExtent: 100,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 0.7,
        children: Colors.primaries
            .asMap()
            .entries
            .map((MapEntry<int, Color> mapEntry) {
          return Container(
            alignment: Alignment.center,
            color: Colors.primaries[mapEntry.key],
            child: Text(
              mapEntry.key.toString(),
              style: const TextStyle(
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
