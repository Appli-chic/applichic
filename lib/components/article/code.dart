import 'package:applichic/utils/hand_cursor.dart';
import 'package:flutter/material.dart';
import 'package:clippy/browser.dart' as clippy;

import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class ACCode extends StatefulWidget {
  final String text;
  final EdgeInsetsGeometry margin;

  ACCode({
    @required this.text,
    this.margin,
  });

  @override
  _ACCodeState createState() => _ACCodeState();
}

class _ACCodeState extends State<ACCode> {
  bool _isHoverClipboard = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: widget.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.maxFinite,
            child: HighlightView(
              widget.text,
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
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              color: !_isHoverClipboard ? Color(0xFF292C33) : Color(0xFFDA4841),
              padding: EdgeInsets.all(16),
              child: InkWell(
                onHover: (bool onHover) {
                  setState(() {
                    _isHoverClipboard = onHover;
                  });
                },
                onTap: () async {
                  await clippy.write(widget.text);
                  final snackBar = SnackBar(
                    content: Text('Copied'),
                    action: SnackBarAction(
                      label: 'OK',
                      onPressed: () {
                        Scaffold.of(context).hideCurrentSnackBar();
                      },
                    ),
                  );

                  Scaffold.of(context).showSnackBar(snackBar);
                },
                child: HandCursor(
                  child: Icon(
                    Icons.content_paste,
                    color: Colors.white,
                  ),
                ),
                splashColor: Colors.white,
                highlightColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
