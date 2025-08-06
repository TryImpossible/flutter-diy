import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/particles.dart';

class OwnGame extends FlameGame with TapDetector {
  late List<Sprite> sprites;
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    sprites = [];
    for (var i = 1; i <= 10; i++) {
      sprites.add(await Sprite.load('touch/star_${'$i'.padLeft(2, '0')}.png'));
    }
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    createIndicator(info.eventPosition.global);
  }

  void createIndicator(Vector2 position) {
    SpriteAnimation indicator = SpriteAnimation.spriteList(
      sprites,
      stepTime: 1 / 15,
      loop: false,
    );
    // 创建 Particle 对象
    Particle particle = SpriteAnimationParticle(
      animation: indicator,
      size: Vector2(30, 30),
    );
    // 创建 ParticleSystemComponent 构件
    final ParticleSystemComponent psc = ParticleSystemComponent(
      particle: particle,
      position: position,
      anchor: Anchor.center,
    );
    // 添加 ParticleSystemComponent 构件
    add(psc);
  }
}
