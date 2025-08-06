import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';

class OwnGame extends FlameGame {
  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    createParticle();

    final ButtonComponent button = ButtonComponent(
      button: TextComponent(text: '创建圆形粒子'),
      position: Vector2(10, 45),
      onPressed: createParticle,
    );
    add(button);

    final ButtonComponent button2 = ButtonComponent(
      button: TextComponent(text: '创建移动粒子'),
      position: button.position + Vector2(button.size.x + 16, 0),
      onPressed: createMovingParticle,
    );
    add(button2);

    final ButtonComponent button3 = ButtonComponent(
      button: TextComponent(text: '批量创建粒子'),
      position: button.position + Vector2(0, button.size.y + 16),
      onPressed: createBatchParticle,
    );
    add(button3);
  }

  void createParticle() {
    // 创建 Particle 对象
    Paint circlePaint = Paint()..color = Colors.white;
    Particle particle = CircleParticle(
      paint: circlePaint,
      radius: 20,
      lifespan: 1,
    );
    // 创建 ParticleSystemComponent 构件
    final ParticleSystemComponent psc = ParticleSystemComponent(
      particle: particle,
      position: size / 2,
    );
    // 添加 ParticleSystemComponent 构件
    add(psc);
  }

  void createMovingParticle() {
    // 创建 Particle 对象
    Paint circlePaint = Paint()..color = Colors.amber;
    Particle particle = MovingParticle(
      child: CircleParticle(paint: circlePaint, radius: 20.0),
      curve: Curves.easeIn,
      lifespan: 3,
      from: Vector2.zero(),
      to: Vector2(size.x - 20 * 2, 0),
    );

    // 创建 ParticleSystemComponent 构件
    final ParticleSystemComponent psc = ParticleSystemComponent(
      particle: particle,
      position: Vector2(20, size.y / 2),
    );
    // 添加 ParticleSystemComponent 构件
    add(psc);
  }

  void createBatchParticle() {
    final List<Color> colors = [
      const Color(0xffff0000),
      const Color(0xff00ff00),
      const Color(0xff0000ff),
    ];

    final List<Vector2> positions = [
      Vector2(-10, 10),
      Vector2(10, 10),
      Vector2(0, -14),
    ];

    // 创建 Particle 对象
    Particle particle = Particle.generate(
      count: 3,
      lifespan: 3,
      generator: (int i) {
        return PaintParticle(
          child: MovingParticle(
            child: CircleParticle(
              paint: Paint()..color = colors[i],
              radius: 20,
            ),
            curve: Curves.easeIn,
            from: positions[i],
            to: i == 0 ? positions.last : positions[i - 1],
          ),
          paint: Paint()..blendMode = BlendMode.difference,
        );
      },
    );

    // 创建 ParticleSystemComponent 构件
    final ParticleSystemComponent psc = ParticleSystemComponent(
      particle: particle,
      position: size / 2,
    );
    // 添加 ParticleSystemComponent 构件
    add(psc);
  }
}
