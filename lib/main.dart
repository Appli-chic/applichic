import 'dart:html';

import 'package:applichic/pages/articles/google_translate_part1.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  print(window.location.href);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Applichic',
      theme: ThemeData(fontFamily: 'Roboto'),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/articles/1': (context) => GoogleTranslatePart1Article(),
      },
    );
  }
}
