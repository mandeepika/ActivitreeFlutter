import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//updated firestore functions
class Store extends StatelessWidget {
final firestoreInstance = Firestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

void _onPressed() async{
  var firebaseUser = await auth.currentUser.uid;
  firestoreInstance.collection("users").document(auth.currentUser.uid).setData(
{}).then((_){
    print("success!");
  });
}


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return FlatButton(onPressed: _onPressed, child: Text("Add User"));
  }
}