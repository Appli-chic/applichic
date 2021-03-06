import 'package:applichic/pages/article_page.dart';
import 'package:applichic/pages/articles/flutter_pokemon_article.dart';
import 'package:applichic/pages/articles/google_translate_part1.dart';
import 'package:applichic/pages/articles/google_translate_part3.dart';
import 'package:flutter/material.dart';

import 'pages/articles/google_translate_part2.dart';
import 'pages/home_page.dart';
import 'pages/recommendation_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Applichic',
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Roboto',
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/articles': (context) => ArticlePage(),
        '/resources': (context) => RecommendationPage(),
        '/articles/3b7add08-a72b-4d13-a425-4640d00d9819': (context) =>
            GoogleTranslatePart1Article(),
        '/articles/101baae8-6c0c-4d61-97c7-aa0ce3623f36': (context) =>
            GoogleTranslatePart2Article(),
        '/articles/6fff9bfe-bd0d-457b-9d1d-1408d6203e40': (context) =>
            FlutterPokemonArticle(),
        '/articles/7c818171-e96a-40c1-978e-7de52456fd0d': (context) =>
            GoogleTranslatePart3Article(),
      },
    );
  }
}
