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
  Widget _displaysArticles(List<Widget> articles) {
    Size size = MediaQuery.of(context).size;

    if (size.width >= 1100) {
      return Container(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: articles,
        ),
      );
    } else if (size.width > 500) {
      return Container(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 32),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: articles.sublist(0, 2),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: articles.sublist(2, 4),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: articles,
        ),
      );
    }
  }

  Widget _displaysRecommendations(List<Widget> recommendations) {
    Size size = MediaQuery.of(context).size;

    if (size.width >= 1100) {
      return Container(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: recommendations,
        ),
      );
    } else if (size.width > 500) {
      return Container(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 32),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: recommendations.sublist(0, 2),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: recommendations.sublist(2, 4),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: recommendations,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> articles = [
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
    ];

    List<Widget> recommendations = [
      RecommendationPreview(
        url:
            "https://medium.com/flutter-community/flutter-statemanagement-with-provider-ee251bbc5ac1",
        imageUrl:
            'https://miro.medium.com/max/3200/1*73IgUxPfyXUKZAaIXgutrw.png',
        title: 'Flutter StateManagement with Provider',
      ),
      Container(),
      Container(),
      Container(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _displaysArticles(articles),
            Container(
              margin: const EdgeInsets.only(left: 22, right: 22, top: 16),
              child: Text(
                "Recommendations to read:",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4A4A4A),
                ),
              ),
            ),
            _displaysRecommendations(recommendations),
            LivePreview(),
            Footer(),
          ],
        ),
      ),
      drawer: size.width > 500
          ? null
          : Drawer(
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Text('Home'),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Articles'),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Resources'),
                  ),
                ],
              ),
            ),
    );
  }
}
