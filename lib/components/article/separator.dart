import 'package:flutter/material.dart';

class ACSeparator extends StatelessWidget {
  final EdgeInsetsGeometry margin;

  ACSeparator({
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Divider(),
    );
  }
}
