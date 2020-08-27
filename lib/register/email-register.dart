import 'package:activitree_edu_flutter/register/email-registration-form.dart';
import 'package:activitree_edu_flutter/register/email-verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailRegisterPage extends StatefulWidget {
  @override
  _EmailRegisterState createState() => _EmailRegisterState();
}

class _EmailRegisterState extends State<EmailRegisterPage> {
  final _auth = FirebaseAuth.instance;
  bool _formSubmitted = false;
  String _email;

  void _onFormSubmitted(String email) {
    _email = email;
    setState(() => _formSubmitted = true);
    _auth.currentUser().then((user) => user.sendEmailVerification());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up with Email'),
      ),
      body: _formSubmitted
          ? EmailVerificationWidget(_email)
          : EmailRegistrationForm(_onFormSubmitted),
    );
  }
}
