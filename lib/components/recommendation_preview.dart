import 'package:flutter/material.dart';

class RecommendationPreview extends StatefulWidget {
  final String imageUrl;
  final String title;
  RecommendationPreview({
    @required this.imageUrl,
    @required this.title,
  });

  @override
  _RecommendationPreviewState createState() => _RecommendationPreviewState();
}

class _RecommendationPreviewState extends State<RecommendationPreview> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Flexible(
      child: Container(
        constraints: BoxConstraints(maxWidth: size.width / 4 - 34),
        margin: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        height: 213,
        width: double.maxFinite,
        child: InkWell(
          onTap: () {},
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                  height: double.maxFinite,
                ),
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
  }
}
