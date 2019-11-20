import 'package:applichic/components/live_preview.dart';
import 'package:flutter/material.dart';

class ACBody extends StatelessWidget {
  final List<Widget> children;
  final Widget preview;
  final bool isPreviewHorizontal;
  final bool isNotWorking;
  final bool isPreviewDisabled;

  ACBody({
    @required this.children,
    this.isNotWorking,
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
                  margin: const EdgeInsets.only(top: 32, bottom: 32),
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
                isNotWorking: true,
                isPreviewDisabled: isPreviewDisabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
