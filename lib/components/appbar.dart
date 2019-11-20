import 'package:applichic/utils/hand_cursor.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  Widget _displaysTitle(BuildContext context) {
    return HandCursor(
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () async {
          await Navigator.of(context).pushNamed('/');
        },
        child: Image.asset(
          'assets/applichic_logo.png',
          height: 31,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (size.width >= 500) {
      return AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: _displaysTitle(context),
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              await Navigator.of(context).pushNamed('/');
            },
            child: Text('Home'),
          ),
          FlatButton(
            onPressed: () async {
              await Navigator.of(context).pushNamed('/articles');
            },
            child: Text('Articles'),
          ),
          FlatButton(
            onPressed: () async {
              await Navigator.of(context).pushNamed('/resources');
            },
            child: Text('Resources'),
          ),
        ],
      );
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        title: _displaysTitle(context),
      );
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(58);
}
