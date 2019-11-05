import 'package:applichic/projects/google_translate/lib/main.dart';
import 'package:flutter/material.dart';

class LivePreview extends StatefulWidget {
  @override
  _LivePreviewState createState() => _LivePreviewState();
}

class _LivePreviewState extends State<LivePreview> {
  @override
  Widget build(BuildContext context) {
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
            child: GoogleTranslateApp(),
          ),
        ],
      ),
    );
  }
}
