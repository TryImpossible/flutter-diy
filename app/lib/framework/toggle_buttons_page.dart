import 'package:flutter/material.dart';

class ToggleButtonPage extends StatefulWidget {
  const ToggleButtonPage({Key? key}) : super(key: key);

  @override
  State<ToggleButtonPage> createState() => _ToggleButtonPageState();
}

class _ToggleButtonPageState extends State<ToggleButtonPage> {
  final List<Widget> _children = <Widget>[
    const Icon(Icons.airplanemode_active),
    const Icon(Icons.directions_bus),
    const Icon(Icons.agriculture),
  ];

  final List<bool> _isSelected = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToggleButtons控件'),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12),
              ToggleButtons(
                isSelected: _isSelected,
                onPressed: _onPressed,
                children: _children,
              ),
              const SizedBox(height: 12),
              ToggleButtons(
                isSelected: _isSelected,
                color: Colors.green.withOpacity(0.7),
                fillColor: Colors.red.withOpacity(0.3),
                focusColor: Colors.yellow.withOpacity(0.3),
                selectedColor: Colors.red,
                disabledColor: Colors.grey,
                highlightColor: Colors.deepOrange.withOpacity(0.4),
                splashColor: Colors.transparent,
                renderBorder: false,
                onPressed: _onPressed,
                children: _children,
              ),
              const SizedBox(height: 12),
              ToggleButtons(
                renderBorder: true,
                isSelected: _isSelected,
                borderColor: Colors.red.withOpacity(0.3),
                selectedBorderColor: Colors.red,
                disabledBorderColor: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                borderWidth: 2,
                onPressed: _onPressed,
                children: _children,
              ),
              const SizedBox(height: 12),
              ToggleButtons(
                renderBorder: true,
                isSelected: _isSelected,
                borderColor: Colors.red.withOpacity(0.3),
                selectedBorderColor: Colors.red,
                disabledBorderColor: Colors.grey,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
                borderWidth: 2,
                onPressed: _onPressed,
                children: _children,
              ),
              const SizedBox(height: 12),
              ToggleButtons(
                renderBorder: true,
                color: Colors.green.withOpacity(0.7),
                fillColor: Colors.red.withOpacity(0.3),
                focusColor: Colors.yellow.withOpacity(0.3),
                selectedColor: Colors.red,
                direction: Axis.vertical,
                isSelected: _isSelected,
                onPressed: _onPressed,
                children: _children,
              ),
              const SizedBox(height: 12),
              ToggleButtons(
                isSelected: const <bool>[true, false, false],
                children: <Widget>[
                  Image.asset(
                    'assets/images/lufei.jpeg',
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/lufei.jpeg',
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/lufei.jpeg',
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed(int index) {
    _isSelected[index] = !_isSelected[index];
    setState(() {});
  }
}
