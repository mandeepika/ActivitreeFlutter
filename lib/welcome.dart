import 'package:activitree_edu_flutter/register/register.dart';
import 'package:activitree_edu_flutter/signin.dart';
import 'package:flutter/material.dart';

// class MyApp extends StatefulWidget {
//   WelcomePage createState() => WelcomePage();
// }

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login or Sign-up',
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Montserrat'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login or Sign-up'),
        ),
        body: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(
                flex: 2,
              ),
              Image.asset('assets/newlogo.png', height: 120, width: 120),
              Spacer(
                flex: 2,
              ),
              Center(
                  child: Text(
                'Welcome to Treehouse',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold),
              )),
              Spacer(
                flex: 1,
              ),
              Center(
                  child: Text(
                'We bridge the gap between high school and college, and make learning accessible and fun for both high schoolers and college students!',
                textAlign: TextAlign.center,
              )),
              Spacer(
                flex: 1,
              ),
              RaisedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn())),
                  child: Text('Login',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Montserrat')),
                  color: Colors.teal[300]),
              const SizedBox(height: 10),
              RaisedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage())),
                  child: Text('Sign up',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Montserrat')),
                  color: Colors.teal[300]),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
