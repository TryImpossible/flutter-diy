import 'package:flutter/material.dart';

class ScannerSweepPage extends StatefulWidget {
  const ScannerSweepPage({Key? key}) : super(key: key);

  @override
  State<ScannerSweepPage> createState() => _ScannerSweepPageState();
}

class _ScannerSweepPageState extends State<ScannerSweepPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildBox(size: 100, shape: BoxShape.rectangle),
            const SizedBox(height: 12),
            _buildBox(size: 100, shape: BoxShape.circle),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                _controller
                  ..reset()
                  ..forward();
              },
              child: const Text('扫描一周'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBox({required double size, required BoxShape shape}) {
    return Stack(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          padding: EdgeInsets.all(size * 0.1),
          decoration: BoxDecoration(
            shape: shape,
            color: Colors.red.withOpacity(0.1),
          ),
          child: const FlutterLogo(),
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (_, Widget? child) {
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: shape,
                gradient: SweepGradient(
                  colors: <Color>[
                    Colors.transparent,
                    Colors.black.withOpacity(0.1),
                  ],
                  stops: <double>[_controller.value, _controller.value],
                ),
              ),
              child: child,
            );
          },
        ),
      ],
    );
  }
}
