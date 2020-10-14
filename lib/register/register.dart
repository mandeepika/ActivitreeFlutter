import 'package:activitree_edu_flutter/register/email-register.dart';
import 'package:activitree_edu_flutter/register/phone-number-register.dart';
import 'package:flutter/material.dart';

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
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PhoneNumberRegisterPage())),
                    child: Text('Sign up with Phone')),
                RaisedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmailRegisterPage())),
                    child: Text('Sign up with Email')),
              ],
            )));
  }
}
