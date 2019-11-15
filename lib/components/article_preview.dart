import 'dart:ui';

import 'package:applichic/utils/hand_cursor.dart';
import 'package:flutter/material.dart';

class ArticlePreview extends StatefulWidget {
  final String imageName;
  final String title;
  final String subTitle;
  final String url;

  ArticlePreview({
    @required this.imageName,
    @required this.title,
    @required this.subTitle,
    @required this.url,
  });

  @override
  _ArticlePreviewState createState() => _ArticlePreviewState();
}

class _ArticlePreviewState extends State<ArticlePreview> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Flexible(
      child: Container(
        constraints: size.width >= 1100
            ? BoxConstraints(maxWidth: size.width / 4 - 34)
            : BoxConstraints(),
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        decoration: BoxDecoration(
          color: Color(0xFF69C0FF),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 213,
        width: double.maxFinite,
        child: HandCursor(
          child: InkWell(
            onTap: () async {
              await Navigator.of(context).pushNamed(widget.url);
            },
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/${widget.imageName}',
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x00EEEEEE),
                        Color(0x4B000000),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16, bottom: 16),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.subTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
