import 'package:flutter/material.dart';

class ACDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (size.width >= 500) {
      return null;
    }

    return Drawer(
      child: Column(
        children: <Widget>[
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
      ),
    );
  }
}
