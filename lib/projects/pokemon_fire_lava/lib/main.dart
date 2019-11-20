import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/battle_screen.dart';

void main() {
  // Set fullscreen
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(FlutterPokemon());
}

class FlutterPokemon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   fontFamily: 'PokemonFireRed',
      //   textTheme: Theme.of(context).textTheme.apply(
      //         fontFamily: 'PokemonFireRed',
      //       ),
      // ),
      home: BattleScreen(),
    );
  }
}
