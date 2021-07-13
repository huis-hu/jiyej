import 'dart:async' as async;

import 'package:bonfire/bonfire.dart';
import 'package:darkness_dungeon/main.dart';
import 'package:darkness_dungeon/util/eden_sprite_sheet.dart';
import 'package:darkness_dungeon/util/functions.dart';
import 'package:darkness_dungeon/util/game_sprite_sheet.dart';
import 'package:darkness_dungeon/util/iszu_sprite_sheet.dart';
import 'package:darkness_dungeon/util/player_sprite_sheet.dart';
import 'package:darkness_dungeon/util/sounds.dart';
import 'package:flutter/material.dart';

class Eden extends SimplePlayer with Lighting, ObjectCollision {

  final Vector2 initPosition;
  double attack = 25;
  double stamina = 100;
  Skill english = Skill();
  Skill dutch = Skill();
  Skill french = Skill();
  Skill math = Skill();
  Skill physics = Skill();
  Skill biology = Skill();
  Skill alchemy = Skill();
  Skill geology = Skill();
  Skill history = Skill();
  Skill enginering = Skill();
  Skill science = Skill();
  int   level = 30;
  double initSpeed = tileSize / 0.025;
  async.Timer _timerStamina;
  bool containKey = false;
  bool showObserveEnemy = false;
  var job = Scientist();
  var skills = [];

  Eden({
    this.initPosition,
  }) : super(
          animation: EdenSpriteSheet.playerAnimations(),
          width: tileSize,
          height: tileSize * 2,
          position: initPosition,
          life: 200,
          speed: tileSize / 0.25,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Size(valueByTileSize(8), valueByTileSize(8)),
            align: Vector2(
              valueByTileSize(4),
              valueByTileSize(8),
            ),
          ),
        ],
      ),
    );

    setupLighting(
      LightingConfig(
        radius: width * 1.5,
        blurBorder: width,
        color: Colors.redAccent.withOpacity(0.2),
      ),
    );
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    this.speed = initSpeed * event.intensity;
    super.joystickChangeDirectional(event);
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.id == 0 && event.event == ActionEvent.DOWN) {
      actionAttackMelee();
    }

    if (event.id == 1 && event.event == ActionEvent.DOWN) {
      actionAttackRange();
    }
    super.joystickAction(event);
  }

  @override
  void die() {
    remove();
    gameRef.addGameComponent(
      GameDecoration.withSprite(
        Sprite.load('player/eden_crypt.png'),
        position: Vector2(
          this.position.center.dx,
          this.position.center.dy,
        ),
        height: 30,
        width: 30,
      ),
    );
    super.die();
  }

  void actionAttackMelee() {
    if (stamina < 15) {
      return;
    }

    Sounds.attackPlayerMelee();
    decrementStamina(15);
    this.simpleAttackMelee(
      animationBottom: EdenSpriteSheet.meleeAttackBottom(),
      animationLeft:   EdenSpriteSheet.meleeAttackLeft(),
      animationRight:  EdenSpriteSheet.meleeAttackRight(),
      animationTop:    EdenSpriteSheet.meleeAttackTop(),
      height:          tileSize,
      width:           tileSize,
      damage:          attack,
    );
  }

  void actionAttackRange() {
    if (stamina < 10) {
      return;
    }

    Sounds.attackRange();

    decrementStamina(10);
    this.simpleAttackRange(
      animationRight:   EdenSpriteSheet.rangeAttackRight(),
      animationLeft:    EdenSpriteSheet.rangeAttackLeft(),
      animationTop:     EdenSpriteSheet.rangeAttackTop(),
      animationBottom:  EdenSpriteSheet.rangeAttackBottom(),
      animationDestroy: EdenSpriteSheet.rangeExplosion(),
      width: tileSize * 0.65,
      height: tileSize * 0.65,
      damage: 10,
      speed: initSpeed * (tileSize / 32),
      destroy: () {
        Sounds.explosion();
      },
      collision: CollisionConfig(
        collisions: [
          CollisionArea.rectangle(size: Size(tileSize / 2, tileSize / 2)),
        ],
      ),
      lightingConfig: LightingConfig(
        radius: tileSize * 0.9,
        blurBorder: tileSize / 2,
        color: Colors.redAccent.withOpacity(0.4),
      ),
    );
  }

  @override
  void update(double dt) {
    if (isDead) return;
    _verifyStamina();
    this.seeEnemy(
      radiusVision: tileSize * 6,
      notObserved: () {
        showObserveEnemy = false;
      },
      observed: (enemies) {
        if (showObserveEnemy) return;
        showObserveEnemy = true;
        _showEmote();
      },
    );
    super.update(dt);
  }

  @override
  void render(Canvas c) {
    super.render(c);
  }

  void _verifyStamina() {
    if (_timerStamina == null) {
      _timerStamina = async.Timer(Duration(milliseconds: 150), () {
        _timerStamina = null;
      });
    } else {
      return;
    }

    stamina += 2;
    if (stamina > 100) {
      stamina = 100;
    }
  }

  void decrementStamina(int i) {
    stamina -= i;
    if (stamina < 0) {
      stamina = 0;
    }
  }

  @override
  void receiveDamage(double damage, dynamic id) {
    if (isDead) return;
    this.showDamage(
      damage,
      config: TextPaintConfig(
        fontSize: valueByTileSize(5),
        color: Colors.orange,
        fontFamily: 'Normal',
      ),
    );
    super.receiveDamage(damage, id);
  }

  void _showEmote({String emote = 'emote/emote_exclamacao.png'}) {
    gameRef.add(
      AnimatedFollowerObject(
        animation: SpriteAnimation.load(
          emote,
          SpriteAnimationData.sequenced(
            amount: 8,
            stepTime: 0.1,
            textureSize: Vector2(32, 32),
          ),
        ),
        target: this,
        positionFromTarget: Rect.fromLTWH(
          18,
          -6,
          tileSize / 2,
          tileSize / 2,
        ).toVector2Rect(),
      ),
    );
  }
}

class Scientist {
}

class Skill {
}
