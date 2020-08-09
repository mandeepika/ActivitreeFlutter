import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatelessWidget {
  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Register')),
        body: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    onPressed: onPressed, child: Text('Sign up with Google')),
                RaisedButton(
                    onPressed: onPressed, child: Text('Sign up with Facebook')),
                RaisedButton(
                    onPressed: onPressed, child: Text('Sign up with Phone')),
                RaisedButton(
                    onPressed: onPressed, child: Text('Sign up with Email')),
              ],
            )));
  }
}
