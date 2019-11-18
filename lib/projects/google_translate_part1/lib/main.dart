import 'package:flutter/material.dart';

import 'screens/home-page.dart';

void main() => runApp(GoogleTranslateAppPart1());

class GoogleTranslateAppPart1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Translate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue[600],
      ),
      home: HomePage(title: 'Google Translate'),
    );
  }
}
