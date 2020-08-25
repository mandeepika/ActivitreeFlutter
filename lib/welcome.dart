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
          margin: const EdgeInsets.all(20),
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
                'Welcome to Activitree',
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
                'Lorem ipsum dolor sit amet consectituer edipiscing elit and more text here varsha is an idiot excuse you oh no caption here ayyyyyyyy bcdefg slkfjlskjfa lfjlkadjs f lkasdjf laksjf and more info here ok done.',
                textAlign: TextAlign.center,
              )),
              Spacer(
                flex: 1,
              ),
              RaisedButton(
                  onPressed: () {
                    print('login pressed');
                  },
                  child: Text('Login',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Montserrat')),
                  color: Colors.teal[300]),
              const SizedBox(height: 10),
              RaisedButton(
                  onPressed: () {
                    print('Sign-up pressed');
                  },
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
