import 'package:flutter/material.dart';

class ACBody extends StatelessWidget {
  final List<Widget> children;

  ACBody({
    @required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
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
      ),
    );
  }
}
