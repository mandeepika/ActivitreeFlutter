import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EmailRegistrationForm extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  final void Function(String email) onSubmitted;

  EmailRegistrationForm(this.onSubmitted);

  void _register(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      try {
        await _auth.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
      } catch (e) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
        return;
      }
      onSubmitted.call(_emailController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Spacer(flex: 1),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (!_validateEmail(value)) {
                      return 'Invalid Email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value.length < 8) {
                      return 'Password should be at least 8 characters';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordConfirmController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords don\'t match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                RaisedButton(
                  onPressed: () => _register(context),
                  child: Text('Sign up'),
                ),
                Spacer(flex: 2),
              ],
            )));
  }

  bool _validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
