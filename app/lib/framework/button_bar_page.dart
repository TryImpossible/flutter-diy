import 'package:flutter/material.dart';

class ButtonBarPage extends StatelessWidget {
  const ButtonBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonBar控件'),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTitle('MainAxisAlignment'),
              Divider(color: Colors.blue.shade300),
              _buildButtonbarByMainAxisAlignment(0),
              Divider(color: Colors.black45),
              _buildButtonbarByMainAxisAlignment(1),
              Divider(color: Colors.black45),
              _buildButtonbarByMainAxisAlignment(2),
              Divider(color: Colors.black45),
              _buildButtonbarByMainAxisAlignment(3),
              Divider(color: Colors.black45),
              _buildButtonbarByMainAxisAlignment(4),
              Divider(color: Colors.black45),
              _buildButtonbarByMainAxisAlignment(5),
              Divider(color: Colors.black45),
              _buildTitle('MainAxisAlignment'),
              Divider(color: Colors.blue.shade300),
              _buildButtonbarByMainAxisSize(0),
              Divider(color: Colors.black45),
              _buildButtonbarByMainAxisSize(1),
              Divider(color: Colors.black45),
              _buildTitle('ButtonTextTheme'),
              Divider(color: Colors.blue.shade300),
              _buildButtonbarByButtonTextTheme(ButtonTextTheme.accent),
              Divider(color: Colors.black45),
              _buildButtonbarByButtonTextTheme(ButtonTextTheme.primary),
              Divider(color: Colors.black45),
              _buildButtonbarByButtonTextTheme(ButtonTextTheme.normal),
              Divider(color: Colors.black45),
              _buildTitle('ButtonSize'),
              Divider(color: Colors.blue.shade300),
              _buildButtonbarByButtonSize(1000, 200, MainAxisAlignment.end),
              Divider(color: Colors.black45),
              _buildTitle('ButtonPaddingSpacing'),
              Divider(color: Colors.blue.shade300),
              _buildButtonBarByPaddingSpacing(30, 10),
              Divider(color: Colors.black45),
              _buildTitle('ButtonOverflowDirection'),
              Divider(color: Colors.blue.shade300),
              _buildButtonBarByOverflowDirection(VerticalDirection.up),
              Divider(color: Colors.black45),
              _buildButtonBarByOverflowDirection(VerticalDirection.down),
              Divider(color: Colors.black45),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildButtonbarByMainAxisAlignment(int index) {
    MainAxisAlignment alignment;
    if (index == 0) {
      alignment = MainAxisAlignment.start;
    } else if (index == 1) {
      alignment = MainAxisAlignment.center;
    } else if (index == 2) {
      alignment = MainAxisAlignment.spaceAround;
    } else if (index == 3) {
      alignment = MainAxisAlignment.spaceBetween;
    } else if (index == 4) {
      alignment = MainAxisAlignment.spaceEvenly;
    } else {
      alignment = MainAxisAlignment.end;
    }
    return ButtonBar(
      alignment: alignment,
      children: <Widget>[
        ElevatedButton(onPressed: null, child: Text('Button')),
        ElevatedButton(onPressed: null, child: Text(alignment.toString())),
      ],
    );
  }

  Widget _buildButtonbarByMainAxisSize(int index) {
    MainAxisSize mainAxisSize;
    if (index == 0) {
      mainAxisSize = MainAxisSize.max;
    } else {
      mainAxisSize = MainAxisSize.min;
    }
    return Container(
      color: Colors.blue.withOpacity(0.3),
      child: ButtonBar(
        mainAxisSize: mainAxisSize,
        children: <Widget>[
          ElevatedButton(onPressed: null, child: Text('Button01')),
          ElevatedButton(onPressed: null, child: Text('Button02')),
          ElevatedButton(onPressed: null, child: Text('Button03')),
        ],
      ),
    );
  }

  Widget _buildButtonbarByButtonTextTheme(ButtonTextTheme theme) {
    return ButtonBar(
      buttonTextTheme: theme,
      children: <Widget>[
        ElevatedButton(onPressed: null, child: Text('Button01')),
        ElevatedButton(onPressed: null, child: Text('Button02')),
        ElevatedButton(child: Text('${theme.toString()}'), onPressed: null),
      ],
    );
  }

  Widget _buildButtonbarByButtonSize(
    double width,
    double height,
    MainAxisAlignment alignment,
  ) {
    return ButtonBar(
      alignment: alignment,
      buttonMinWidth: width,
      buttonHeight: height,
      children: <Widget>[
        ElevatedButton(onPressed: null, child: Text('Button01')),
        ElevatedButton(
          child: Text('Button 02', style: TextStyle(color: Colors.blue)),
          onPressed: null,
        ),
        ElevatedButton(child: Text('${alignment.toString()}'), onPressed: null),
      ],
    );
  }

  Widget _buildButtonBarByPaddingSpacing(double padding, double spacing) {
    return ButtonBar(
      overflowButtonSpacing: spacing,
      buttonPadding: EdgeInsets.all(padding),
      children: <Widget>[
        ElevatedButton(child: Text('Button 01'), onPressed: null),
        ElevatedButton(
            child: Text('Button 02', style: TextStyle(color: Colors.blue)),
            onPressed: null),
        ElevatedButton(child: Text('Button 03'), onPressed: null)
      ],
    );
  }

  Widget _buildButtonBarByOverflowDirection(VerticalDirection direction) {
    return ButtonBar(
      overflowDirection: direction,
      children: <Widget>[
        ElevatedButton(child: Text('Button 01'), onPressed: null),
        ElevatedButton(
            child: Text('Button 02', style: TextStyle(color: Colors.blue)),
            onPressed: null),
        ElevatedButton(child: Text('Button 03'), onPressed: null),
        ElevatedButton(child: Text('${direction.toString()}'), onPressed: null),
      ],
    );
  }
}
