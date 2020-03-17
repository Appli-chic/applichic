import 'package:applichic/utils/hand_cursor.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  Widget _displaysTitle(BuildContext context) {
    String actualRoute = ModalRoute.of(context).settings.name;
    Size size = MediaQuery.of(context).size;
    String logoUrl = 'assets/applichic_logo.png';

    if (size.width >= 500) {
      logoUrl = 'assets/applichic_logo.png';
    } else {
      logoUrl = 'assets/applichic_logo_small.png';
    }

    return HandCursor(
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () async {
          if (actualRoute != '/') {
            await Navigator.of(context).pushNamed('/');
          }
        },
        child: Image.asset(
          logoUrl,
          height: size.width >= 500 ? 31 : 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String actualRoute = ModalRoute.of(context).settings.name;

    if (size.width >= 500) {
      return AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: _displaysTitle(context),
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              if (actualRoute != '/') {
                await Navigator.of(context).pushNamed('/');
              }
            },
            child: Text('Home'),
          ),
          FlatButton(
            onPressed: () async {
              if (actualRoute != '/articles') {
                await Navigator.of(context).pushNamed('/articles');
              }
            },
            child: Text('Articles'),
          ),
          FlatButton(
            onPressed: () async {
              if (actualRoute != '/resources') {
                await Navigator.of(context).pushNamed('/resources');
              }
            },
            child: Text('Resources'),
          ),
        ],
      );
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
            icon: Icon(Icons.dehaze),
            onPressed: () => Scaffold.of(context).openDrawer()),
        title: _displaysTitle(context),
      );
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(58);
}
