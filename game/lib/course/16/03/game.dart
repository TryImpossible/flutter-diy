import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';

class OwnGame extends FlameGame with TapDetector {
  final Random _random = Random();

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    createParticle(info.eventPosition.global);
  }

  void createParticle(Vector2 position) {
    CircleParticle circleParticle = CircleParticle(
      radius: 10,
      paint: Paint()..color = randomColor(),
    );
    Particle particle = Particle.generate(
      count: 10,
      lifespan: 4,
      generator: (int i) {
        print('123');
        return AcceleratedParticle(
          child: circleParticle,
          acceleration: randomVector(),
          speed: randomVector(),
          position: position,
        );
      },
    );
    ParticleSystemComponent psc = ParticleSystemComponent(particle: particle);
    add(psc);
  }

  Color randomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(255),
      _random.nextInt(255),
      _random.nextInt(255),
    );
  }

  Vector2 randomVector() {
    Vector2 base = Vector2.random();
    Vector2 fix = Vector2(-0.5, -0.5);
    base = base + fix;
    return base * 200;

    // Vector2 base = Vector2.random();
    // Vector2 fix = Vector2(-0.5, 0);
    // base = base + fix;
    // return base * 200;
  }
}
