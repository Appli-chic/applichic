import 'package:applichic/components/appbar.dart';
import 'package:applichic/components/article_preview.dart';
import 'package:applichic/utils/data.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    double itemWidth = 0.0;
    int crossAxisCount = 4;

    if (size.width >= 1100) {
      itemWidth = size.width / 4 - 34;
    } else if (size.width > 500) {
      crossAxisCount = 2;
      itemWidth = size.width / 2;
    } else {
      crossAxisCount = 1;
      itemWidth = size.width;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 10,
        childAspectRatio: (itemWidth / 213),
        children: List<Widget>.from(articles).map((article) {
          if (article is ArticlePreview) {
            ArticlePreview articlePreview = article;

            return ArticlePreview(
              imageName: articlePreview.imageName,
              title: articlePreview.title,
              subTitle: articlePreview.subTitle,
              url: articlePreview.url,
              isInGrid: true,
            );
          } else {
            return Container();
          }
        }).toList(),
      ),
    );
  }
}
