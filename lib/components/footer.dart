import 'package:flutter/material.dart';
import 'dart:html' as html;

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool _isHoverGithub = false;
  bool _isHoverTwitter = false;
  bool _isHoverDiscord = false;

  /// Displays information about me
  Widget _displaysPersonalInformation() {
    return Row(
      children: <Widget>[
        Container(
          width: 70,
          height: 70,
          child: ClipOval(
            child: Image.asset(
              'assets/guillaume.jpg',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 8, left: 4),
                child: Text(
                  'Guillaume Belouin',
                  style: TextStyle(
                    color: Color(0xFF7B7B7B),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8, left: 4),
                child: Text(
                  'Web and mobile developer in love with Flutter.\nMy passion is learning and sharing knowledge.',
                  style: TextStyle(
                    color: Color(0xFF7B7B7B),
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.location_on, color: Color(0xFFEB3838)),
                  Text(
                    'Angers, France',
                    style: TextStyle(
                      color: Color(0xFFEB3838),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Shows my social network (Twitter, Discord, Github)
  Widget _displaysSocialNetworks() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        children: <Widget>[
          Container(
            height: 1,
            width: 200,
            color: Color(0xFF979797),
            margin: const EdgeInsets.only(bottom: 16),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: InkWell(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    html.window.open('https://github.com/Appli-chic', 'Github');
                  },
                  onHover: (bool hasEntered) {
                    setState(() {
                      _isHoverGithub = hasEntered;
                    });
                  },
                  child: Image.asset(
                    _isHoverGithub
                        ? 'assets/github_logo_hover.png'
                        : 'assets/github_logo.png',
                    height: 40,
                    color: Color(0xFF7B7B7B),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: InkWell(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    html.window
                        .open('https://twitter.com/applichic', 'Twitter');
                  },
                  onHover: (bool hasEntered) {
                    setState(() {
                      _isHoverTwitter = hasEntered;
                    });
                  },
                  child: Image.asset(
                    _isHoverTwitter
                        ? 'assets/twitter_logo_hover.png'
                        : 'assets/twitter_logo.png',
                    height: 40,
                    color: Color(0xFF7B7B7B),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  html.window.open('https://discord.gg/QtdQ3A7', 'Discord');
                },
                onHover: (bool hasEntered) {
                  setState(() {
                    _isHoverDiscord = hasEntered;
                  });
                },
                child: Image.asset(
                  _isHoverDiscord
                      ? 'assets/discord_logo_hover.png'
                      : 'assets/discord_logo.png',
                  height: 35,
                  color: Color(0xFF7B7B7B),
                ),
              ),
            ],
          ),
          Container(
            height: 1,
            width: 200,
            color: Color(0xFF979797),
            margin: const EdgeInsets.only(top: 16),
          ),
        ],
      ),
    );
  }

  /// Displays the important informations about my company
  Widget _displaysCompanyInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Company contact',
            style: TextStyle(
              color: Color(0xFF7B7B7B),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Text(
            '36 rue bougere, 49000 \nAngers, France',
            style: TextStyle(
              color: Color(0xFF7B7B7B),
              fontSize: 16,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Text(
            'SIREN: 839 498 300',
            style: TextStyle(
              color: Color(0xFF7B7B7B),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  /// Displays me email to contact me
  Widget _displaysContact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Contact me',
            style: TextStyle(
              color: Color(0xFF7B7B7B),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Text(
            'gbelouin@applichic.com',
            style: TextStyle(
              color: Color(0xFF7B7B7B),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24, left: 16, right: 16),
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _displaysPersonalInformation(),
              _displaysSocialNetworks(),
              _displaysCompanyInformation(),
              _displaysContact(),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              "Copyright © 2018-2019 Applichic",
              style: TextStyle(
                color: Color(0xFF7B7B7B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
