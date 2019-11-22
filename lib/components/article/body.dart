import 'package:applichic/components/live_preview.dart';
import 'package:flutter/material.dart';

class ACBody extends StatelessWidget {
  final List<Widget> children;
  final Widget preview;
  final bool isPreviewHorizontal;
  final bool isPreviewDisabled;

  ACBody({
    @required this.children,
    this.preview,
    this.isPreviewHorizontal,
    this.isPreviewDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600),
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 32, bottom: 32, left: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  ),
                ),
              ),
              LivePreview(
                isPreviewHorizontal: isPreviewHorizontal,
                preview: preview,
                isPreviewDisabled: isPreviewDisabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
