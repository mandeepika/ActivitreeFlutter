import 'package:activitree_edu_flutter/dashboard.dart';
import 'package:activitree_edu_flutter/home.dart';
import 'package:activitree_edu_flutter/todolist.dart';
import 'package:activitree_edu_flutter/signin.dart';
import 'package:activitree_edu_flutter/welcome.dart';
//import 'package:activitree_edu_flutter/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Nav extends StatefulWidget {
  Nav({Key key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    MyStatefulWidget(),
    ToDoList(),
    SignIn(),
    WelcomePage(),
    Text(
      'Me',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Dashboard'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            //title: Text('Sign In'),
            title: Text('To Do List'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Sign In'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
