import 'package:applichic/utils/hand_cursor.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class ACLink extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry margin;

  ACLink({
    @required this.text,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: HandCursor(
        child: GestureDetector(
          onTap: () {
            html.window.open(text, 'Link');
          },
          child: SelectableText(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
