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
      paint: Paint()..color = Colors.white,
    );
    Particle particle = Particle.generate(
      count: 10,
      lifespan: 1,
      generator: (int i) {
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

  Vector2 randomVector() {
    Vector2 base = Vector2.random(_random);
    return base * 200;
  }
}
