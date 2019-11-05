import 'package:applichic/components/appbar.dart';
import 'package:applichic/components/article_preview.dart';
import 'package:applichic/components/footer.dart';
import 'package:applichic/components/live_preview.dart';
import 'package:applichic/components/recommendation_preview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8, top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ArticlePreview(
                    imageName: 'flutter_logo.png',
                    title: 'Flutter: Google Translate',
                    subTitle: 'Make the design',
                  ),
                  ArticlePreview(
                    imageName: 'flutter_logo.png',
                    title: 'Flutter: Google Translate',
                    subTitle: 'Make it work',
                  ),
                  ArticlePreview(
                    imageName: 'flutter_logo.png',
                    title: 'Flutter: Google Translate',
                    subTitle: 'Make the design',
                  ),
                  ArticlePreview(
                    imageName: 'flutter_logo.png',
                    title: 'Flutter: Google Translate',
                    subTitle: 'Make the design',
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 22, right: 22, top: 32),
              child: Text(
                "Recommendations to read:",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4A4A4A),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8, top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RecommendationPreview(
                    imageUrl:
                        'https://miro.medium.com/max/3200/1*73IgUxPfyXUKZAaIXgutrw.png',
                    title: 'Flutter StateManagement with Provider',
                  ),
                ],
              ),
            ),
            LivePreview(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
