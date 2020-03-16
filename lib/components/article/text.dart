import 'package:flutter/material.dart';

class ACText extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry margin;

  ACText({
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
          fontSize: 18,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
      ),
    );
  }
}
