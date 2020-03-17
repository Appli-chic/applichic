import 'package:flutter/material.dart';

class ACDrawer extends StatelessWidget {
  Widget _displayTile({
    BuildContext context,
    String route,
    IconData icon,
    String text,
  }) {
    String actualRoute = ModalRoute.of(context).settings.name;

    if (actualRoute == route) {
      return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 4),
        decoration: BoxDecoration(
          color: Color(0x1F661FFF),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: ListTile(
          onTap: () async {
            if (actualRoute != route) {
              await Navigator.of(context).pushNamed(route);
            }
          },
          leading: Icon(icon, color: Color(0xFF661FFF)),
          title: Text(
            text,
            style: TextStyle(
              color: Color(0xFF661FFF),
            ),
          ),
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 4),
        child: ListTile(
          onTap: () async {
            if (actualRoute != route) {
              await Navigator.of(context).pushNamed(route);
            }
          },
          leading: Icon(icon, color: Colors.black54),
          title: Text(text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (size.width >= 500) {
      return null;
    }

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 8, left: 10, right: 10),
            child: Image.asset(
              'assets/applichic_logo.png',
              height: 20,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 8),
            child: Divider(
              color: Colors.black,
              thickness: 0.2,
            ),
          ),
          _displayTile(
            context: context,
            route: '/',
            icon: Icons.home,
            text: 'Home',
          ),
          _displayTile(
            context: context,
            route: '/articles',
            icon: Icons.book,
            text: 'Articles',
          ),
          _displayTile(
            context: context,
            route: '/resources',
            icon: Icons.insert_drive_file,
            text: 'Resources',
          ),
        ],
      ),
    );
  }
}
