import 'package:flutter/material.dart';

class ACTitle2 extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry margin;

  ACTitle2({
    @required this.text,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
