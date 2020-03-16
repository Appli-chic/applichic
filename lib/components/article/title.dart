import 'package:flutter/material.dart';

class ACTitle extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry margin;

  ACTitle({
    @required this.text,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: SelectableText(
        text,
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
