import 'package:applichic/components/article_preview.dart';
import 'package:applichic/components/recommendation_preview.dart';
import 'package:flutter/material.dart';

List<Widget> articles = [
  ArticlePreview(
    imageName: 'pokemon.png',
    title: 'Flutter: Pokémon and Flutter',
    subTitle: 'A battle system unfinished',
    url: '/articles/6fff9bfe-bd0d-457b-9d1d-1408d6203e40',
  ),
  ArticlePreview(
    imageName: 'google_translate_part_2.png',
    title: 'Flutter: Google Translate',
    subTitle: 'Make it work',
    url: '/articles/101baae8-6c0c-4d61-97c7-aa0ce3623f36',
  ),
  ArticlePreview(
    imageName: 'google_translate_part_1.png',
    title: 'Flutter: Google Translate',
    subTitle: 'Make the design',
    url: '/articles/3b7add08-a72b-4d13-a425-4640d00d9819',
  ),
  Flexible(child: Container()),
];

List<Widget> recommendations = [
  RecommendationPreview(
    url:
        "https://medium.com/flutter-community/flutter-statemanagement-with-provider-ee251bbc5ac1",
    imageUrl: 'https://miro.medium.com/max/3200/1*73IgUxPfyXUKZAaIXgutrw.png',
    title: 'Flutter StateManagement with Provider',
  ),
  RecommendationPreview(
    url:
    "https://medium.com/flutter-community/developing-for-multiple-screen-sizes-and-orientations-in-flutter-fragments-in-flutter-a4c51b849434",
    imageUrl: 'https://cdn-images-1.medium.com/fit/t/800/240/1*CepzV9bWJVSFvhcKhTOP1g.jpeg',
    title: 'Developing for Multiple Screen Sizes',
  ),
  RecommendationPreview(
    url:
    "https://medium.com/hackernoon/why-flutter-uses-dart-dd635a054ebf",
    imageUrl: 'https://cdn-images-1.medium.com/fit/t/800/240/1*bAUFoOPQ3gcv7y4Kdz82tw.png',
    title: 'Why Flutter Uses Dart',
  ),
  RecommendationPreview(
    url:
    "https://medium.com/@adityadroid/60-days-of-flutter-building-a-messenger-from-scratch-ab2c89e1fd0f",
    imageUrl: 'https://cdn-images-1.medium.com/fit/t/800/240/1*gvvcImxr5vV8hzqsmF9SQw.jpeg',
    title: 'Building a Messenger from Scratch',
  ),
];
