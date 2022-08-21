import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'ball.dart';

class OwnGame extends FlameGame with TapDetector, DoubleTapDetector {
  int _counter = 0;

  @override
  Future<void>? onLoad() {
    _addBall();
  }

  void _addBall() {
    final Ball ball = Ball(tag: 'tag$_counter');
    add(ball);
    _counter++;
  }

  @override
  void onTap() {
    _addBall();
  }

  @override
  void onDoubleTap() {
    List<Ball> balls = children.whereType<Ball>().toList();
    if (balls.isNotEmpty) {
      balls.first.removeFromParent();
    }
  }
}
