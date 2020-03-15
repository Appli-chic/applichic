import 'dart:ui';

import 'package:applichic/utils/hand_cursor.dart';
import 'package:flutter/material.dart';

class ArticlePreview extends StatefulWidget {
  final String imageName;
  final String title;
  final String subTitle;
  final String url;
  final bool isInGrid;

  ArticlePreview({
    @required this.imageName,
    @required this.title,
    @required this.subTitle,
    @required this.url,
    this.isInGrid,
  });

  @override
  _ArticlePreviewState createState() => _ArticlePreviewState();
}

class _ArticlePreviewState extends State<ArticlePreview> {
  BoxConstraints _getBoxConstraints() {
    var size = MediaQuery.of(context).size;

    if (size.width >= 1100) {
      return BoxConstraints(maxWidth: size.width / 4 - 34);
    } else if (size.width > 500) {
      return BoxConstraints(maxWidth: size.width / 2 - 34);
    } else {
      return BoxConstraints();
    }
  }

  @override
  Widget build(BuildContext context) {
    var child = Container(
      constraints: _getBoxConstraints(),
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
              Container(
                margin: const EdgeInsets.all(32),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/${widget.imageName}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Opacity(
                  opacity: 0.8,
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  ),
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
    );

    if (widget.isInGrid != null && widget.isInGrid) {
      return child;
    } else {
      return Flexible(
        child: child,
      );
    }
  }
}
