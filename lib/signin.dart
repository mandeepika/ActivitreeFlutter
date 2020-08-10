import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  // This widget is the root of your application.
    SignIn({Key key}) : super(key: key);
    final _formKey = GlobalKey<FormState>();
    static const String _title = 'Flutter Code Sample';
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body:
      SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 130),
          RaisedButton(
            onPressed: () {},
            child: const Text('Sign in with Google', style: TextStyle(fontSize: 20)),
            textColor: Colors.white,
            color: Colors.red[800],
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Colors.white)
          ),

          ),
          const SizedBox(height: 10),
                    RaisedButton(
            onPressed: () {},
            child: const Text('Sign In with Facebook', style: TextStyle(fontSize: 20)),
            textColor: Colors.white,
            color: Colors.lightBlue[900],
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Colors.white)
          ),
          ),
          const SizedBox(height: 20),
          Text('---OR---'),
          //const SizedBox(height: 30),
          new Container(
          margin: const EdgeInsets.all(30.0),
          child: Form(
          key: _formKey,
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            //padding: const EdgeInsets.all(20),
            decoration: const InputDecoration(
              hintText: 'Enter your email',
              
            ),
            
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
                   TextFormField(
            //padding: const EdgeInsets.all(20),
            decoration: const InputDecoration(
              hintText: 'Enter your password',
              
            ),
            
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Text('Sign In'),
            ),
          ),
        ],
      ),
    )
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
     FlatButton(
       //padding: const EdgeInsets.only(left: 20.0,),
      onPressed: () {
        /*...*/
      },
      child: Text(
        "New User!",
      ),
    ),  
    FlatButton(
       // padding: const EdgeInsets.only(left: 190.0,),
      onPressed: () {
        /*...*/
      },
      child: Text(
        
        "Forgot Password?",
      ),
    )
        ],)
        ],
      ),
    ));
    
  //return Text("Haaaai friendsss yooo!");
  }
}
