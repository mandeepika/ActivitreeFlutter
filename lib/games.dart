import 'package:flutter/material.dart';

class GamesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Explore Games';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(50, (index) {
            return Card(
                shadowColor: Colors.teal[300],
                child: Center(
                  child: Text(
                    'Game $index',
                    style: TextStyle(
                        color: Colors.teal[300],
                        fontWeight: FontWeight.bold,
                        fontSize: 36),
                  ),
                ));
          }),
        ),
      ),
    );
  }
}
