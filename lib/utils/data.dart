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
    url: '/articles/1548779f-cdda-4c20-a226-c71982a432d1',
  ),
  Container(),
  Container(),
];

List<Widget> recommendations = [
  RecommendationPreview(
    url:
        "https://medium.com/flutter-community/flutter-statemanagement-with-provider-ee251bbc5ac1",
    imageUrl: 'https://miro.medium.com/max/3200/1*73IgUxPfyXUKZAaIXgutrw.png',
    title: 'Flutter StateManagement with Provider',
  ),
  Container(),
  Container(),
  Container(),
];
