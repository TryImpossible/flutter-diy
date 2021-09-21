import 'package:flutter/material.dart';

class ToggleButtonWidgetActivity extends StatefulWidget {
  const ToggleButtonWidgetActivity({Key? key}) : super(key: key);

  @override
  _ToggleButtonWidgetActivityState createState() =>
      _ToggleButtonWidgetActivityState();
}

class _ToggleButtonWidgetActivityState
    extends State<ToggleButtonWidgetActivity> {
  final List<Widget> _children = <Widget>[
    Icon(Icons.airplanemode_active),
    Icon(Icons.directions_bus),
    Icon(Icons.agriculture),
  ];

  List<bool> _isSelected = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToggleButtons控件'),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12),
              ToggleButtons(
                isSelected: _isSelected,
                onPressed: _onPressed,
                children: _children,
              ),
              SizedBox(height: 12),
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
              SizedBox(height: 12),
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
              SizedBox(height: 12),
              ToggleButtons(
                renderBorder: true,
                isSelected: _isSelected,
                borderColor: Colors.red.withOpacity(0.3),
                selectedBorderColor: Colors.red,
                disabledBorderColor: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
                borderWidth: 2,
                onPressed: _onPressed,
                children: _children,
              ),
              SizedBox(height: 12),
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
              SizedBox(height: 12),
              ToggleButtons(
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
                isSelected: <bool>[true, false, false],
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
