import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  SecondPage createState() => SecondPage();
}

class SecondPage extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login or Sign-up',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login or Sign-up'),
        ),
        body: Column(
          children: <Widget>[
            Text('Welcome to Activitree'),
            FlatButton(onPressed: null, child: Text('Login')),
            FlatButton(onPressed: null, child: Text('Sign up'))
          ],
        ),
      ),
    );
  }
}
