import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temp Page'),
      ),
      body: Center(
        child: FutureBuilder<FirebaseUser>(
            future: FirebaseAuth.instance.currentUser(),
            builder: (context, snapshot) {
              final user = snapshot.data;
              if (user == null) {
                return Text('Loading...');
              } else {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(user.displayName),
                      Text(user.email),
                      RaisedButton(
                        child: Text('Sign Out'),
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                        },
                      ),
                    ]);
              }
            }),
      ),
    );
  }
}
