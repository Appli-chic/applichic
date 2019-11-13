import 'dart:html' as html;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HandCursor extends Listener {
  // get a reference to the body element that we previously altered
  static final appContainer =
      html.window.document.getElementById('app-container');

  HandCursor({Widget child})
      : super(
            onPointerHover: (PointerHoverEvent evt) {
              appContainer.style.cursor = 'pointer';
              // you can use any of these:
              // 'help', 'wait', 'move', 'crosshair', 'text' or 'pointer'
              // more options/details here: http://www.javascripter.net/faq/stylesc.htm
            },
            onPointerExit: (PointerExitEvent evt) {
              // set cursor's style 'default' to return it to the original state
              appContainer.style.cursor = 'default';
            },
            child: child);
}
