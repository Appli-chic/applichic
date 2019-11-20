import 'package:applichic/components/appbar.dart';
import 'package:applichic/components/article/body.dart';
import 'package:applichic/components/article/image.dart';
import 'package:applichic/components/article/link.dart';
import 'package:applichic/components/article/separator.dart';
import 'package:applichic/components/article/spacer.dart';
import 'package:applichic/components/article/subtitle.dart';
import 'package:applichic/components/article/text.dart';
import 'package:applichic/components/article/title.dart';
import 'package:applichic/components/article/title2.dart';
import 'package:flutter/material.dart';

class FlutterPokemonArticle extends StatefulWidget {
  @override
  _FlutterPokemonArticleState createState() => _FlutterPokemonArticleState();
}

class _FlutterPokemonArticleState extends State<FlutterPokemonArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(),
      body: ACBody(
        isPreviewDisabled: true,
        children: <Widget>[
          ACTitle(
            text: "Pokémon and Flutter",
          ),
          ACSubTitle(
            text: "A battle system unfinished",
            margin: const EdgeInsets.only(top: 8),
          ),
          ACSpacer(),
          ACImage(
            url: "assets/articles/flutter_pokemon/first_image.png",
          ),
          ACSpacer(),
          ACText(
            text:
                "I was wondering if creating a game in Flutter would be possible, and Pokémon directly came to mind because it seemed like the most fun game to make. The battle system is far from being finished, but I wanted to write about what I have experienced so far.",
          ),
          ACSpacer(),
          ACImage(
            url: "assets/articles/flutter_pokemon/second_image.gif",
          ),
          ACSpacer(),
          ACTitle2(
            text: "State management",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "The state system offered by Flutter makes it easy to manage how the screen refreshes. It is even easier to create a logic in a service that refreshes the screen with the Provider library.",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 8),
            text: "https://pub.dev/packages/provider",
          ),
          ACSpacer(),
          ACTitle2(
            text: "Interface",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "Creating the interface was easy using Columns and Rows like we would do in HTML/CSS with FlexBox. Nevertheless, I didn’t try to create a responsive design interface, but I think it must be feasible. For anyone that may want to try the application I created, using the iPhone XR emulator would give the best experience.",
          ),
          ACSpacer(),
          ACTitle2(
            text: "Audio",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "About the music, I downloaded the battle theme of Pokémon and played it in the loop thanks to the audioplayers library.",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 8),
            text: "https://pub.dev/packages/audioplayers",
          ),
          ACSpacer(),
          ACTitle2(
            text: "Animation",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "The animation part was the hardest part for me, and I’m still unsatisfied with it. It is easy to animate the life bar decreasing when receiving damage thanks to the AnimatedContainer. But the thundershock animation looks peculiar. To make the thundershock animation, I used Nima from 2dimensions, the same that created Flare. This technology makes it very easy to create animations and display them with Flutter. I struggled with its implementation in a Stack which I believe I’m doing wrong; otherwise, it is straightforward to use.",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 8),
            text: "https://www.2dimensions.com/",
          ),
          ACSeparator(margin: const EdgeInsets.only(top: 32)),
          ACSpacer(),
          ACText(
            text: "Here are the animations I created with Nima:",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 8),
            text:
                "https://www.2dimensions.com/a/applichic/files/nima/pokemon-abilities/preview",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 16),
            text:
                "https://www.2dimensions.com/a/applichic/files/nima/pokemon_main_character/preview",
          ),
          ACSpacer(),
          ACTitle2(
            text: "Conclusion",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "I had a great time testing my skills with Flutter. I’m conscious I did a lot of things wrong while programming it and that I lack knowledge about how to build a game, however it was a pleasant experience putting my knowledge into practice.",
          ),
          ACSpacer(),
          ACText(
            text:
                "I’m sure it is possible to create mobile games with Flutter like a Candy Crush. I found some game engines in Flutter like Flame that looks very interesting.",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 8),
            text: "https://github.com/flame-engine/flame",
          ),
          ACSpacer(),
          ACText(
            text: "And of course the code is available on Github right here:",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 8),
            text: "https://github.com/Appli-chic/pokemon_fire_lava",
          ),
        ],
      ),
    );
  }
}
