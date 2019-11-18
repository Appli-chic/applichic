import 'package:applichic/components/live_preview.dart';
import 'package:flutter/material.dart';

class ACBody extends StatelessWidget {
  final List<Widget> children;
  final Widget preview;

  ACBody({
    @required this.children,
    this.preview,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Container(
                margin: const EdgeInsets.only(top: 32, bottom: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ),
            ),
            LivePreview(
              preview: preview,
            ),
          ],
        ),
      ),
    );
  }
}
