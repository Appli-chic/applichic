import 'package:applichic/components/article_preview.dart';
import 'package:applichic/components/recommendation_preview.dart';
import 'package:flutter/material.dart';

List<Widget> articles = [
  ArticlePreview(
    imageName: 'flutter_logo.png',
    title: 'Flutter: Google Translate',
    subTitle: 'Make the design',
    url: '/articles/3b7add08-a72b-4d13-a425-4640d00d9819',
  ),
  ArticlePreview(
    imageName: 'flutter_logo.png',
    title: 'Flutter: Google Translate',
    subTitle: 'Make it work',
    url: '/articles/101baae8-6c0c-4d61-97c7-aa0ce3623f36',
  ),
  ArticlePreview(
    imageName: 'flutter_logo.png',
    title: 'Flutter: Pokémon and Flutter',
    subTitle: 'A battle system unfinished',
    url: '/articles/6fff9bfe-bd0d-457b-9d1d-1408d6203e40',
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
  Flexible(child: Container()),
  Flexible(child: Container()),
  Flexible(child: Container()),
];
