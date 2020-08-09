import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Card(
                color: Colors.teal[50],
                margin: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15.0, bottom: 10.0),
                child: ListTile(
                  title: Text('Topic1'),
                  subtitle: Text('This is the subtitle'),
                  trailing: Icon(Icons.arrow_right),
                  leading: Icon(Icons.bookmark),
                ),
              ),
              Card(
                color: Colors.teal[50],
                margin: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
                child: ListTile(
                  title: Text('Topic2'),
                  subtitle: Text('This is the subtitle'),
                  trailing: Icon(Icons.arrow_right),
                  leading: Icon(Icons.bookmark),
                ),
              ),
              Card(
                color: Colors.teal[50],
                margin: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
                child: ListTile(
                  title: Text('Topic3'),
                  subtitle: Text('This is the subtitle'),
                  trailing: Icon(Icons.arrow_right),
                  leading: Icon(Icons.bookmark),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), title: Text('Profile')),
            BottomNavigationBarItem(
                icon: Icon(Icons.computer), title: Text('Games')),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), title: Text('Connect')),
            BottomNavigationBarItem(
                icon: Icon(Icons.alarm), title: Text('To-do'))
          ],
          currentIndex: _selectedItem,
          onTap: (index) {
            setState(() {
              _selectedItem = index;
            });
          },
        ),
      ),
    );
  }
}
