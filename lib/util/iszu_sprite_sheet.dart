import 'package:bonfire/bonfire.dart';

class IszuSpriteSheet {
  static Future<SpriteAnimation> idleRight() => SpriteAnimation.load(
        'player/iszu_idle.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32, 64),
        ),
      );

  static Future<SpriteAnimation> meleeAttackBottom() => SpriteAnimation.load(
        'player/atack_effect_bottom.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(32, 64),
        ),
      );

  static Future<SpriteAnimation> meleeAttackLeft() => SpriteAnimation.load(
        'player/atack_effect_left.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(32, 64),
        ),
      );
  static Future<SpriteAnimation> meleeAttackRight() => SpriteAnimation.load(
        'player/atack_effect_right.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(32, 64),
        ),
      );
  static Future<SpriteAnimation> meleeAttackTop() => SpriteAnimation.load(
        'player/atack_effect_top.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(32, 64),
        ),
      );

  static SimpleDirectionAnimation playerAnimations() =>
      SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          'player/iszu_idle_left.png',
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(32, 64),
          ),
        ),
        idleRight: idleRight(),
        runLeft: SpriteAnimation.load(
          'player/iszu_run_left.png',
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(32, 64),
          ),
        ),
        runRight: SpriteAnimation.load(
          'player/iszu_run.png',
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(32, 64),
          ),
        ),
      );
  static Future<SpriteAnimation> rangeAttackBottom() => SpriteAnimation.load(
    'player/iszu_range_bottom.png',
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(32, 64),
    ),
  );

  static Future<SpriteAnimation> rangeAttackLeft() => SpriteAnimation.load(
    'player/iszu_range_left.png',
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(32, 64),
    ),
  );
  static Future<SpriteAnimation> rangeAttackRight() => SpriteAnimation.load(
    'player/iszu_range_right.png',
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(32, 64),
    ),
  );
  static Future<SpriteAnimation> rangeAttackTop() => SpriteAnimation.load(
    'player/iszu_range_top.png',
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(32, 64),
    ),
  );

  static Future<SpriteAnimation> rangeExplosion() => SpriteAnimation.load(
    'player/iszu_range_explosion.png',
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(32, 64),
    ),
  );
}
