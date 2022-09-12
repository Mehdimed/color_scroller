import 'package:flutter/material.dart';
import 'package:color_scroller/routes.dart';
import 'package:color_scroller/theme.dart';

void main() {
  runApp(const ColorScroller());
}

class ColorScroller extends StatelessWidget {
  const ColorScroller({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      theme: mainTheme,
    );
  }
}
