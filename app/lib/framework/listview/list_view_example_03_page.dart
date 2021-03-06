import 'package:flutter/material.dart';

class ListViewExample03Page extends StatelessWidget {
  const ListViewExample03Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: Colors.primaries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 40),
            color: Colors.primaries[index],
            alignment: Alignment.center,
            child: Text(
              index.toString(),
              style: const TextStyle(
                fontSize: 21,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
