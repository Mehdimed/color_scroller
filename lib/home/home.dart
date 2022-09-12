import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // create a future that will return a list of 20 colors
  // each color will be a color from the material color palette
  // colors are ordered to form a gradient

  Future<List<MaterialColor>> _getColors() async {
    var colors = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.blue,
      Colors.lightBlue,
      Colors.cyan,
      Colors.teal,
      Colors.green,
      Colors.lightGreen,
      Colors.lime,
      Colors.yellow,
      Colors.amber,
      Colors.orange,
      Colors.deepOrange,
      Colors.brown,
      Colors.grey,
      Colors.blueGrey,
    ];

    // return the list of 20 colors
    return Future(() => colors);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder(
        future: _getColors(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // if the future has returned a list of colors
            // create a list of widgets that will display the colors
            var colorWidgets = snapshot.data!
                .map((color) => GestureDetector(
                      child: Hero(
                        tag: color.toString(),
                        child: Container(
                          color: color,
                          height: 100,
                        ),
                      ),
                      onTap: () {
                        // when a color is tapped, navigate to the color page
                        // pass the color as an argument
                        Navigator.pushNamed(context, '/shade',
                            arguments: color);
                      },
                    ))
                .toList();

            // return a list view that will display the colors
            return ListView(
              children: colorWidgets,
            );
          } else {
            // if the future has not returned a list of colors
            // return a loading indicator
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
