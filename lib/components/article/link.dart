import 'package:applichic/utils/hand_cursor.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class ACLink extends StatefulWidget {
  final String text;
  final EdgeInsetsGeometry margin;

  ACLink({
    @required this.text,
    this.margin,
  });

  @override
  _ACLinkState createState() => _ACLinkState();
}

class _ACLinkState extends State<ACLink> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: HandCursor(
        child: InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            html.window.open(widget.text, 'Link');
          },
          child: Text(
            widget.text,
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
