import 'package:applichic/projects/google_translate_part2/lib/main.dart';
import 'package:flutter/material.dart';

class LivePreview extends StatefulWidget {
  final Widget preview;

  LivePreview({
    this.preview,
  });

  @override
  _LivePreviewState createState() => _LivePreviewState();
}

class _LivePreviewState extends State<LivePreview> {
  Widget _displaysDefaultPreview() {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      color: Color(0xFF262260),
      width: double.maxFinite,
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 32),
            child: Text(
              "LIVE PREVIEW",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 24),
            child: Text(
              "A preview of Flutter applications\n in the website for each articles.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 32),
            height: 700,
            width: 394,
            color: Color(0xFF69B4EA),
            child: GoogleTranslateAppPart2(),
          ),
        ],
      ),
    );
  }

  Widget _displaysArticlePreview() {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      color: Color(0xFF262260),
      width: double.maxFinite,
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 32, top: 32),
            height: 700,
            width: 394,
            color: Color(0xFF69B4EA),
            child: widget.preview,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.preview == null) {
      return _displaysDefaultPreview();
    } else {
      return _displaysArticlePreview();
    }
  }
}
