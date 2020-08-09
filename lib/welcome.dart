import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  WelcomePage createState() => WelcomePage();
}

class WelcomePage extends State<MyApp> {
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
            FlatButton(
                onPressed: () {
                  print('login pressed');
                },
                child: Text('Login'),
                color: Colors.teal[300]),
            FlatButton(
                onPressed: () {
                  print('Sign-up pressed');
                },
                child: Text('Sign up'),
                color: Colors.teal[300])
          ],
        ),
      ),
    );
  }
}
