import 'package:flutter/material.dart';

class MaterialWidgetPage extends StatelessWidget {
  const MaterialWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material控件'),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 12),
              Material(
                color: Colors.amber,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    width: 1,
                    style: BorderStyle.none,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '你好 Material',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Material(
                color: Colors.amber,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(200),
                  side: BorderSide(
                    width: 1,
                    style: BorderStyle.none,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    '你好 Material',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Material(
                color: Colors.amber,
                shape: BorderDirectional(
                  start: BorderSide(color: Colors.red, width: 8),
                  top: BorderSide(color: Colors.blue, width: 8),
                  end: BorderSide(color: Colors.brown, width: 8),
                  bottom: BorderSide(color: Colors.green, width: 8),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    '你好 Material',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Material(
                color: Colors.amber,
                shape: CircleBorder(
                  side: BorderSide(
                    color: Colors.green,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(48),
                  child: Text(
                    '你好 Material',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Material(
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2.0,
                    color: Colors.brown,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  padding: const EdgeInsets.all(48),
                  child: Text(
                    '你好 Material',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Material(
                color: Colors.amber,
                shape: StadiumBorder(
                  side: const BorderSide(width: 2.0, color: Colors.brown),
                ),
                child: Container(
                  width: 360,
                  height: 80,
                  alignment: Alignment.center,
                  child: Text(
                    '你好 Material',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Material(
                color: Colors.amber,
                shape: StadiumBorder(
                  side: const BorderSide(width: 2.0, color: Colors.brown),
                ),
                child: Container(
                  width: 80,
                  height: 360,
                  alignment: Alignment.center,
                  child: Text(
                    '你好\nMaterial',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Material(
                ///必须要设置颜色
                color: Colors.amber,
                elevation: 10.0,

                ///阴影颜色
                shadowColor: Colors.green,
                borderRadius: new BorderRadius.circular(8.0),
                type: MaterialType.button,
                child: Container(
                  width: 100,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    '你好 Material',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
