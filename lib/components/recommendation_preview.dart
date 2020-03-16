import 'package:applichic/utils/hand_cursor.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class RecommendationPreview extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String url;
  final bool isInGrid;

  RecommendationPreview({
    @required this.imageUrl,
    @required this.title,
    @required this.url,
    this.isInGrid,
  });

  @override
  _RecommendationPreviewState createState() => _RecommendationPreviewState();
}

class _RecommendationPreviewState extends State<RecommendationPreview> {
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
        borderRadius: BorderRadius.circular(8),
      ),
      height: 213,
      width: double.maxFinite,
      child: HandCursor(
        child: InkWell(
          onTap: () {
            html.window.open(widget.url, 'Recommendation');
          },
          child: Stack(
            children: <Widget>[
              Opacity(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                    height: double.maxFinite,
                  ),
                ),
                opacity: 0.9,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Opacity(
                  opacity: 0.8,
                  child: Container(
                    height: 50,
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
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
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
