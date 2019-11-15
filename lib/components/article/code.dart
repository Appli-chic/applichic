import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class ACCode extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry margin;

  ACCode({
    @required this.text,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: HighlightView(
        text,
        language: 'dart',
        theme: atomOneDarkTheme,
        padding: EdgeInsets.all(12),
        textStyle: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
      ),
    );
  }
}
