import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame_ext/flame_ext.dart';

import '../game.dart';
import 'hero.dart';
import 'monster.dart';

class MonsterManager extends PositionComponent with HasGameReference<OwnGame> {
  MonsterManager({
    required this.bossSpriteSheet,
    required this.bossBulletSpriteAnimation,
    required this.stoneSpriteSheet,
    required this.stoneBulletSpriteAnimation,
  }) : super(anchor: Anchor.center);

  final SpriteSheet bossSpriteSheet;
  final SpriteAnimation bossBulletSpriteAnimation;
  final SpriteSheet stoneSpriteSheet;
  final SpriteAnimation stoneBulletSpriteAnimation;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    createBoss();
    final int lineCount = 3;
    final double step = game.size.y / lineCount;
    for (var i = 1; i <= lineCount; i++) {
      final double pY = i * step - 48;
      final double pX = game.size.x - 90;
      createStone(Vector2(pX, pY), false);
    }
    for (int i = 1; i <= lineCount; i++) {
      final double pY = i * step - 48;
      final double pX = 90;
      createStone(Vector2(pX, pY), true);
    }
  }

  void createBoss() {
    final SpriteAnimation animation = SpriteAnimation.spriteList(
      bossSpriteSheet.getSprites(),
      stepTime: 1 / 24,
      loop: true,
    );

    final Vector2 monsterSize = Vector2(64, 64);
    final Vector2 monsterPosition = Vector2(
      game.size.x - monsterSize.x / 2,
      game.size.y / 2,
    );
    final HeroAttr heroAttr = HeroAttr(
      life: 4000,
      speed: 100,
      attackSpeed: 200,
      attackRange: 600,
      attack: 100,
      crit: 0.5,
      critDamage: 1.5,
    );
    final Monster monster = Monster(
      animation: animation,
      size: monsterSize,
      position: monsterPosition,
      bulletSprite: bossBulletSpriteAnimation,
      bulletSize: Vector2(720 / 4, 658 / 4),
      attr: heroAttr,
      isLeft: false,
    );
    add(monster);
  }

  void createStone(Vector2 position, bool isLeft) {
    final List<Sprite> sprites = stoneSpriteSheet.getRowSprites(
      row: 0,
      start: 5,
      count: 4,
    );
    final SpriteAnimation animation = SpriteAnimation.spriteList(
      sprites,
      stepTime: 1 / 10,
      loop: true,
    );
    final Vector2 monsterSize = Vector2(32, 48);
    final HeroAttr heroAttr = HeroAttr(
      life: 200,
      speed: 0,
      attackSpeed: 200,
      attackRange: 400,
      attack: 20,
      crit: 0,
      critDamage: 1,
    );
    final Monster monster = Monster(
      animation: animation,
      size: monsterSize,
      position: position,
      bulletSprite: stoneBulletSpriteAnimation,
      bulletSize: Vector2(470 / 15, 258 / 15),
      attr: heroAttr,
      isLeft: isLeft,
    );
    add(monster);
  }
}
