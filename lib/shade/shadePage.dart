import 'package:flutter/material.dart';

class ShadePage extends StatelessWidget {
  const ShadePage({super.key});

  Future<List<Color>> _getShades(MaterialColor color) async {
    var shades = [
      color.shade900,
      color.shade800,
      color.shade700,
      color.shade600,
      color.shade500,
      color.shade400,
      color.shade300,
      color.shade200,
      color.shade100,
      color.shade50,
    ];

    // return the list of 20 colors
    return Future(() => shades);
  }

  @override
  Widget build(BuildContext context) {
    // get the arguments passed to this route
    // and extract the color in a nullable variable
    var selectedColor =
        ModalRoute.of(context)!.settings.arguments as MaterialColor?;

    return FutureBuilder(
      future: _getShades(selectedColor!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // if the future has returned a list of colors
          // create a list of widgets that will display the colors
          var colorWidgets = snapshot.data!.map((color) {
            return GestureDetector(
              child: Hero(
                tag: color == selectedColor.shade500
                    ? selectedColor.toString()
                    : color.toString(),
                child: Container(
                  color: color,
                  height: 100,
                ),
              ),
              onTap: () {
                // when a color is tapped, navigate to the color page
                // pass the color as an argument
                Navigator.pushNamed(context, '/color', arguments: color);
              },
            );
          }).toList();

          // return a list view of the color widgets
          return ListView(
            children: colorWidgets,
          );
        } else {
          // if the future has not returned a list of colors
          // return a loading indicator
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
