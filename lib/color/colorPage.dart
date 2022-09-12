import 'package:flutter/material.dart';

class ColorPage extends StatelessWidget {
  const ColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedColor = ModalRoute.of(context)!.settings.arguments as Color?;

    return Hero(
      tag: selectedColor.toString(),
      child: Container(
        color: selectedColor,
        height: double.infinity,
      ),
    );
  }
}
