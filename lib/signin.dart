//import 'package:activitree_edu_flutter/register.dart';
import 'package:activitree_edu_flutter/dashboard.dart';
import 'package:activitree_edu_flutter/register/register.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignIn extends StatelessWidget {
  
  // This widget is the root of your application.

  
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String> signInWithGoogle() async {
    
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final authResult = await auth.signInWithCredential(credential);
    final user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final currentUser = auth.currentUser;
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Sign Out");
  }

  // void inputData() async {
  //   final FirebaseUser user = await auth.currentUser();
  //   final uid = user.uid;
  //   print(uid);
  // }

  SignIn({Key key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  static const String _title = 'Flutter Code Sample';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    dispose();
  }

  @override
  SignIn createState() => SignIn();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("Sign In")),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 130),
              RaisedButton(
                onPressed: () {
                  signInWithGoogle().whenComplete(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return Dashboard();
                          //route to register page for testing
                        },
                      ),
                    );
                  });
                },
                child: const Text('Sign in with Google',
                    style: TextStyle(fontSize: 20)),
                textColor: Colors.white,
                color: Colors.teal[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.white)),
              ),
              const SizedBox(height: 10),
              RaisedButton(
                onPressed: () {},
                child: const Text('Sign In with Facebook',
                    style: TextStyle(fontSize: 20)),
                textColor: Colors.white,
                color: Colors.teal[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.white)),
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
                          controller: _emailController,
                          //obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                          ),

                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            if (!_validateEmail(value))
                            {
                              return ("Invalid email");
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          //padding: const EdgeInsets.all(20),
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your password',
                          ),

                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            if (value.length<8)
                            {
                              return ("Password should be at least 8 characters");
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: RaisedButton(
                            //onPressed: () {
                            //  // Validate will return true if the form is valid, or false if
                            //   // the form is invalid.
                            //   return showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return AlertDialog(
                            //         // Retrieve the text the that user has entered by using the
                            //         // TextEditingController.
                            //         content: Text(myController.text),
                            //       );
                            //     },
                            //   );
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                              try {
                                FirebaseUser user = (await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ))
                                    .user;
                                // if (user != null) {
                                //   Navigator.of(context).pushNamed(AppRoutes.menu);
                                // }
                              } catch (e) {
                                print(e);
                                _emailController.text = "";
                                _passwordController.text = "";
                              }
                              }
                            }, 
                            child: Text('Sign In'),
                          ),
                        ),
                      ],
                    ),
                  )),

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
                ],
              ),
            ],
          ),
        ));
  }
}

bool _validateEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
