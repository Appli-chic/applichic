import 'package:flutter/material.dart';

class ACSubTitle extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry margin;

  ACSubTitle({
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
          fontSize: 28,
          fontWeight: FontWeight.w400,
          color: Colors.black54,
        ),
      ),
    );
  }
}
