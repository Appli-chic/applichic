import 'package:flutter/material.dart';

import 'screens/home-page.dart';

void main() => runApp(GoogleTranslateApp());

class GoogleTranslateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Applichic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue[600],
      ),
      home: HomePage(title: 'Google Translate'),
    );
  }
}
