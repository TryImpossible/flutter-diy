import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatelessWidget {
  TweenAnimationBuilderPage({Key? key}) : super(key: key);

  final PageController _controller = PageController();
  final List<String> _types = <String>['变大变小', '缩放', '旋转', '平移'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        controller: _controller,
        children: const <Widget>[
          _PageView1(),
          _PageView2(),
          _PageView3(),
          _PageView4(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 44,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _types.map((e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    child: Text(e),
                    onPressed: () {
                      _controller.animateToPage(
                        _types.indexOf(e),
                        duration: kThemeAnimationDuration,
                        curve: Curves.linear,
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _PageView4 extends StatelessWidget {
  const _PageView4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        key: UniqueKey(),
        duration: const Duration(seconds: 1),
        tween: Tween(begin: Offset.zero, end: const Offset(100, 100)),
        builder: (BuildContext context, Offset value, Widget? child) {
          return Container(
            width: 300,
            height: 300,
            color: Colors.blue,
            child: Center(
              child: Transform.translate(
                offset: value,
                child: const Text(
                  'Hi',
                  style: TextStyle(fontSize: 50.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PageView3 extends StatelessWidget {
  const _PageView3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 1),
        tween: Tween(begin: 0.0, end: 3.14),
        builder: (BuildContext context, double value, Widget? child) {
          return Container(
            width: 300,
            height: 300,
            color: Colors.blue,
            child: Center(
              child: Transform.rotate(
                angle: value,
                child: const Text(
                  'Hi',
                  style: TextStyle(fontSize: 50.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PageView2 extends StatelessWidget {
  const _PageView2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 1),
        tween: Tween(begin: 1.0, end: 1.6),
        builder: (BuildContext context, double value, Widget? child) {
          return Container(
            width: 300,
            height: 300,
            color: Colors.blue,
            child: Center(
              child: Transform.scale(
                scale: value,
                child: const Text(
                  'Hi',
                  style: TextStyle(fontSize: 50.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PageView1 extends StatefulWidget {
  const _PageView1({
    Key? key,
  }) : super(key: key);

  @override
  State<_PageView1> createState() => _PageView1State();
}

class _PageView1State extends State<_PageView1> {
  bool _big = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 1),
        tween: Tween(end: _big ? 120.0 : 50.0),
        builder: (BuildContext context, double value, Widget? child) {
          return GestureDetector(
            onTap: () => setState(() => _big = !_big),
            child: Container(
              width: 300,
              height: 300,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Hi',
                  style: TextStyle(fontSize: value),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
