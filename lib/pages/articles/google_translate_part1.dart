import 'package:applichic/components/appbar.dart';
import 'package:flutter/material.dart';

class GoogleTranslatePart1Article extends StatefulWidget {
  @override
  _GoogleTranslatePart1ArticleState createState() =>
      _GoogleTranslatePart1ArticleState();
}

class _GoogleTranslatePart1ArticleState
    extends State<GoogleTranslatePart1Article> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(),
      body: SingleChildScrollView(),
    );
  }
}
