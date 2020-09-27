import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Temp Page'),
        ),
        body: Center(
          child: _user == null
              ? Text('Loading...')
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(_user.displayName),
                    Text(_user.email),
                    RaisedButton(
                      child: Text('Sign Out'),
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                    )
                  ],
                ),
        ));
  }
}
