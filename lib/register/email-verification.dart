import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailVerificationWidget extends StatelessWidget {
  final _user = FirebaseAuth.instance.currentUser;
  final String _email;

  EmailVerificationWidget(this._email);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              'Email Verification Required',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Text('The verification email is sent to $_email.'),
          ),
          SizedBox(height: 16),
          RaisedButton(
            child: Text('I have verified my email'),
            onPressed: () async {
              if (_user.emailVerified) {
                Navigator.pop(context);
              } else {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Email has not been verified yet!'),
                ));
              }
            },
          ),
          FlatButton(
            child: Text('Skip now'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
