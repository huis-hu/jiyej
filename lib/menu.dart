import 'dart:async' as async;

import 'package:bonfire/bonfire.dart';
import 'package:darkness_dungeon/game.dart';
import 'package:darkness_dungeon/util/custom_sprite_animation_widget.dart';
import 'package:darkness_dungeon/util/eden_sprite_sheet.dart';
import 'package:darkness_dungeon/util/enemy_sprite_sheet.dart';
import 'package:darkness_dungeon/util/iszu_sprite_sheet.dart';
import 'package:darkness_dungeon/util/jin_sprite_sheet.dart';
import 'package:darkness_dungeon/util/jolee_sprite_sheet.dart';
import 'package:darkness_dungeon/util/localization/strings_location.dart';
import 'package:darkness_dungeon/util/player_sprite_sheet.dart';
import 'package:darkness_dungeon/util/sounds.dart';
import 'package:darkness_dungeon/util/yinoch_sprite_sheet.dart';
import 'package:darkness_dungeon/yinoch_game.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'eden_game.dart';
import 'iszu_game.dart';
import 'jin_game.dart';
import 'jolee_game.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool showSplash = false;
  int currentPosition = 3;
  async.Timer _timer;
  var jin    = JinSpriteSheet.idleRight();
  var jolee  = JoleeSpriteSheet.idleRight();
  var yinoch = YinochSpriteSheet.idleRight();
  var eden   = EdenSpriteSheet.idleRight();
  var iszu   = IszuSpriteSheet.idleRight();

  var titleStyle =  TextStyle(
      color:        Colors.white,
      fontFamily:   'Bold',
      fontSize:     30.0);

  @override
  void dispose() {
    Sounds.stopBackgroundSound();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: showSplash ? buildSplash() : buildMenu(),
    );
  }
Column playerColumn(anim, name, game){
 return Column(
      children: <Widget>[
        SizedBox( height: 100,width: 100),
        SizedBox( height: 200,width: 100, child: CustomSpriteAnimationWidget(animation: anim)),
        ElevatedButton( child: Text( name, style: titleStyle),
            onPressed: () { Navigator.push( context,MaterialPageRoute(builder: (context)=>game));})]);

}

  Widget buildMenu() {
    return Scaffold(
      backgroundColor: Colors.black,
      body:

        Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox( height: 100,width: 30, ),
                  playerColumn(jin, 'Jin', JinGame()),
                  SizedBox( height: 100,width: 30, ),
                  playerColumn(iszu, 'Iszu', IszuGame()),
                  SizedBox( height: 100,width: 30, ),
                  playerColumn(yinoch, 'Yinoch', YinochGame()),
                  SizedBox( height: 100,width: 30, ),
                  playerColumn(eden, 'Eden', EdenGame()),
                  SizedBox( height: 100,width: 30, ),
                  playerColumn(jolee, 'Jolee', JoleeGame()),
    ]

    ));
  }

  Widget buildSplash() {
    return FlameSplashScreen(
      theme: FlameSplashTheme.dark,
      onFinish: (BuildContext context) {
        setState(() {
          showSplash = true;
        });
        startTimer();
      },
    );
  }

  void startTimer() {
    _timer = async.Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
      });
      print(currentPosition);
    });
  }

  Widget startgame(BuildContext context) {
    switch( currentPosition){
    case 0: return JinGame();
    case 1: return JoleeGame();
    case 2: return YinochGame();
    case 3: return EdenGame();
    case 4: return IszuGame();
    }
  }
}
