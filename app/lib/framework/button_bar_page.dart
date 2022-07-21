import 'package:flutter/material.dart';

class ButtonBarPage extends StatelessWidget {
  const ButtonBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ButtonBar控件'),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTitle('MainAxisAlignment'),
              Divider(color: Colors.blue.shade300),
              _buildButtonbarByMainAxisAlignment(0),
              const Divider(color: Colors.black45),
              _buildButtonbarByMainAxisAlignment(1),
              const Divider(color: Colors.black45),
              _buildButtonbarByMainAxisAlignment(2),
              const Divider(color: Colors.black45),
              _buildButtonbarByMainAxisAlignment(3),
              const Divider(color: Colors.black45),
              _buildButtonbarByMainAxisAlignment(4),
              const Divider(color: Colors.black45),
              _buildButtonbarByMainAxisAlignment(5),
              const Divider(color: Colors.black45),
              _buildTitle('MainAxisAlignment'),
              Divider(color: Colors.blue.shade300),
              _buildButtonbarByMainAxisSize(0),
              const Divider(color: Colors.black45),
              _buildButtonbarByMainAxisSize(1),
              const Divider(color: Colors.black45),
              _buildTitle('ButtonTextTheme'),
              Divider(color: Colors.blue.shade300),
              _buildButtonbarByButtonTextTheme(ButtonTextTheme.accent),
              const Divider(color: Colors.black45),
              _buildButtonbarByButtonTextTheme(ButtonTextTheme.primary),
              const Divider(color: Colors.black45),
              _buildButtonbarByButtonTextTheme(ButtonTextTheme.normal),
              const Divider(color: Colors.black45),
              _buildTitle('ButtonSize'),
              Divider(color: Colors.blue.shade300),
              _buildButtonbarByButtonSize(1000, 200, MainAxisAlignment.end),
              const Divider(color: Colors.black45),
              _buildTitle('ButtonPaddingSpacing'),
              Divider(color: Colors.blue.shade300),
              _buildButtonBarByPaddingSpacing(30, 10),
              const Divider(color: Colors.black45),
              _buildTitle('ButtonOverflowDirection'),
              Divider(color: Colors.blue.shade300),
              _buildButtonBarByOverflowDirection(VerticalDirection.up),
              const Divider(color: Colors.black45),
              _buildButtonBarByOverflowDirection(VerticalDirection.down),
              const Divider(color: Colors.black45),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        title,
        style: const TextStyle(
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
        const ElevatedButton(onPressed: null, child: Text('Button')),
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
        children: const <Widget>[
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
        const ElevatedButton(onPressed: null, child: Text('Button01')),
        const ElevatedButton(onPressed: null, child: Text('Button02')),
        ElevatedButton(onPressed: null, child: Text(theme.toString())),
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
        const ElevatedButton(onPressed: null, child: Text('Button01')),
        const ElevatedButton(
          onPressed: null,
          child: Text('Button 02', style: TextStyle(color: Colors.blue)),
        ),
        ElevatedButton(onPressed: null, child: Text(alignment.toString())),
      ],
    );
  }

  Widget _buildButtonBarByPaddingSpacing(double padding, double spacing) {
    return ButtonBar(
      overflowButtonSpacing: spacing,
      buttonPadding: EdgeInsets.all(padding),
      children: const <Widget>[
        ElevatedButton(onPressed: null, child: Text('Button 01')),
        ElevatedButton(
          onPressed: null,
          child: Text('Button 02', style: TextStyle(color: Colors.blue)),
        ),
        ElevatedButton(onPressed: null, child: Text('Button 03'))
      ],
    );
  }

  Widget _buildButtonBarByOverflowDirection(VerticalDirection direction) {
    return ButtonBar(
      overflowDirection: direction,
      children: <Widget>[
        const ElevatedButton(onPressed: null, child: Text('Button 01')),
        const ElevatedButton(
          onPressed: null,
          child: Text('Button 02', style: TextStyle(color: Colors.blue)),
        ),
        const ElevatedButton(onPressed: null, child: Text('Button 03')),
        ElevatedButton(onPressed: null, child: Text(direction.toString())),
      ],
    );
  }
}
