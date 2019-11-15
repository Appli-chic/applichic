import 'package:flutter/material.dart';

class ACImage extends StatelessWidget {
  final String url;
  final EdgeInsetsGeometry margin;

  ACImage({
    @required this.url,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin,
        child: Image.asset(url),
      ),
    );
  }
}
