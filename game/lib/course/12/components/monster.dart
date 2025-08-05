import 'dart:async';

import 'package:flame/components.dart';
import 'package:game/course/12/components/anim_bullet.dart';

import '../game.dart';
import '../minixs/liveable.dart';
import 'hero.dart';

class Monster extends SpriteAnimationComponent
    with Liveable, HasGameReference<OwnGame> {
  Monster({
    required SpriteAnimation animation,
    required Vector2 size,
    required Vector2 position,
    required this.bulletSprite,
    required this.bulletSize,
    required this.attr,
    required this.isLeft,
  }) : super(
         animation: animation,
         size: size,
         position: position,
         anchor: Anchor.center,
       );

  final SpriteAnimation bulletSprite;
  final Vector2 bulletSize;
  final HeroAttr attr;
  final bool isLeft;

  late Timer _timer;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    _timer = Timer(3, onTick: addBullet, repeat: true);
    initPaint(lifePoint: attr.life);
  }

  // 添加子弹
  void addBullet() {
    AnimBullet bullet = AnimBullet(
      animation: bulletSprite,
      speed: attr.attackSpeed,
      maxRange: attr.attackRange,
      type: BulletType.monster,
      isLeft: isLeft,
      attr: attr,
    );
    bullet.priority = 1;
    bullet.size = bulletSize;
    bullet.anchor = Anchor.center;
    bullet.position = position - Vector2(0, bulletSize.y / 2);
    game.add(bullet);

    priority = 2;
  }

  @override
  void onMount() {
    super.onMount();
    _timer.start();
  }

  @override
  void update(double dt) {
    super.update(dt);
    _timer.update(dt);
  }

  @override
  void onRemove() {
    super.onRemove();
    _timer.stop();
  }

  @override
  void onDied() {
    removeFromParent();
  }
}
