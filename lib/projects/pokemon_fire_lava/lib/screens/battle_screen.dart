import 'package:applichic/projects/pokemon_fire_lava/lib/components/battle_actions.dart';
import 'package:applichic/projects/pokemon_fire_lava/lib/components/battle_enemy_side.dart';
import 'package:applichic/projects/pokemon_fire_lava/lib/components/battle_player_side.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class BattleScreen extends StatefulWidget {
  BattleScreen({Key key}) : super(key: key);

  @override
  _BattleScreenState createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  AudioCache audioPlayer = AudioCache();

  @override
  void initState() {
    super.initState();
    audioPlayer.clearCache();
    // audioPlayer.loop('projects/pokemon_fire_lava/fight_music.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/projects/pokemon_fire_lava/background-grass.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BattleEnemySide(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                BattlePlayerSide(),
                BattleActions(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
