import 'package:flutter/material.dart';

class GridViewExample01Page extends StatelessWidget {
  const GridViewExample01Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
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
