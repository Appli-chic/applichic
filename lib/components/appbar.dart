import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: AnimatedContainer(
        duration: Duration(seconds: 3),
        child: Image.asset(
          'assets/applichic_logo.png',
          height: 31,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text('Home'),
        ),
        FlatButton(
          onPressed: () {},
          child: Text('Articles'),
        ),
        FlatButton(
          onPressed: () {},
          child: Text('Resources'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(58);
}
