import 'package:bonfire/bonfire.dart';

class EdenSpriteSheet {
  static Future<SpriteAnimation> idleRight() => SpriteAnimation.load(
        'eden/idle.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32, 64),
        ),
      );

  static Future<SpriteAnimation> meleeAttackBottom() => SpriteAnimation.load(
        'eden/melee_bottom.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(32, 64),
        ),
      );

  static Future<SpriteAnimation> meleeAttackLeft() => SpriteAnimation.load(
        'eden/melee_left.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(32, 64),
        ),
      );
  static Future<SpriteAnimation> meleeAttackRight() => SpriteAnimation.load(
        'eden/melee_right.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(32, 64),
        ),
      );
  static Future<SpriteAnimation> meleeAttackTop() => SpriteAnimation.load(
        'eden/melee_top.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(32, 64),
        ),
      );

  static SimpleDirectionAnimation playerAnimations() =>
      SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          'eden/idle_left.png',
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(32, 64),
          ),
        ),
        idleRight: idleRight(),
        runLeft: SpriteAnimation.load(
          'eden/run_left.png',
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(32, 64),
          ),
        ),
        runRight: SpriteAnimation.load(
          'eden/run.png',
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(32, 64),
          ),
        ),
      );

  static Future<SpriteAnimation> rangeAttackBottom() => SpriteAnimation.load(
    'eden/range_bottom.png',
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(32, 64),
    ),
  );

  static Future<SpriteAnimation> rangeAttackLeft() => SpriteAnimation.load(
    'eden/range_left.png',
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(32, 64),
    ),
  );
  static Future<SpriteAnimation> rangeAttackRight() => SpriteAnimation.load(
    'eden/range_right.png',
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(32, 64),
    ),
  );
  static Future<SpriteAnimation> rangeAttackTop() => SpriteAnimation.load(
    'eden/range_top.png',
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(32, 64),
    ),
  );

  static Future<SpriteAnimation> rangeExplosion() => SpriteAnimation.load(
    'eden/explosion.png',
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(32, 64),
    ),
  );
}
