import 'package:flutter/material.dart';

class _UI extends StatefulWidget {
  const _UI({Key? key}) : super(key: key);

  @override
  State<_UI> createState() => _UIState();
}

class _UIState extends State<_UI> {
  bool _tapped = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _tapped = !_tapped;
            });
          },
          child: Container(
            width: 100,
            height: 100,
            color: _tapped ? Color(0x22000000) : Color(0xFF000000),
          ),
        ),
      ),
    );
  }
}

void runWidgetUI() {
  runApp(_UI());
}
