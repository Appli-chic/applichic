import 'package:flutter/material.dart';

class ACTitle1 extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry margin;

  ACTitle1({
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
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
