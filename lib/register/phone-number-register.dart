import 'package:flutter/material.dart';

class PhoneNumberRegisterPage extends StatelessWidget {
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up with Phone Number'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _phoneNumberController,
            validator: (value) {
              return null; // TODO: Validate Phone Number
            },
          )
        ],
      ),
    );
  }
}
