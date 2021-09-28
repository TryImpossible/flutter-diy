import 'package:flutter/material.dart';

class GridViewExample01Fragment extends StatelessWidget {
  const GridViewExample01Fragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
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
