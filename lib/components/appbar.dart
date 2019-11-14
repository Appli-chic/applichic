import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (size.width > 500) {
      return AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: AnimatedContainer(
          duration: Duration(seconds: 3),
          child: Image.asset(
            'assets/applichic_logo.png',
            height: 31,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              await Navigator.of(context).pushNamed('/');
            },
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
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        title: AnimatedContainer(
          duration: Duration(seconds: 3),
          child: Image.asset(
            'assets/applichic_logo.png',
            height: 31,
          ),
        ),
      );
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(58);
}
