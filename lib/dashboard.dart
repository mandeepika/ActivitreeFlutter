import 'package:activitree_edu_flutter/todolist.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:activitree_edu_flutter/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//For To Do List:
//Folowing Gearóid M's documentation on Medium.com
//https://medium.com/the-web-tub/making-a-todo-app-with-flutter-5c63dab88190
//Also following Karan Verma's documentation on Medium.com
//https://github.com/hydroweaver/medium_wip_todo/blob/master/lib/main.dart
//https://stackoverflow.com/questions/56953911/flutter-trouble-with-multiselect-checkboxes-data-from-firestore/56956573#56956573
//https://stackoverflow.com/questions/49827598/how-to-get-user-id-from-firebase-auth-in-flutter/49828903 for user id


class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  // @override
  // inputData() async {
  //   final FirebaseUser user = await auth.currentUser();
  //   final uid = user.uid;
  //   return Text(uid);
  //   // here you write the codes to input the data into firestore
  //   //     {
  //   //   if (auth.currentUser != null) {
  //   //         print(uid);
  //   // }
  // }

  // Dashboard.build()
  // {
  //   if (auth.currentUser != null) {
  //         print(auth.currentUser.uid);
  // }
  @override
  _Dashboard createState() => _Dashboard();
  // FirebaseUser getUser()
  // {return
  // }
  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
}

class _Dashboard extends State<Dashboard> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(title: Text("Dashboard")),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            child: Center(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Text(auth.currentUser.uid),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.mood),
                  title: Text('\nKitchen Towel Calculus!'),
                  subtitle: Text(
                      '\n Topics Covered: Disk and Washer Method \n (and the many interesting uses of kitchen items!)'),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('CONTINUE'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
                LinearProgressIndicator(),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.mood),
                  title: Text('\nRecommended: Integration Review'),
                  subtitle: Text(
                      '\nTopics Covered: Disk and Washer Method \nPractice Set'),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('START'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
                //LinearProgressIndicator(),
              ],
            ),
          ),
          const SizedBox(height: 40),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ToDoList()),
              );
            },
            child: const Text('TO DO LIST!', style: TextStyle(fontSize: 25)),
            textColor: Colors.white,
            color: Colors.teal[300],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
                side: BorderSide(color: Colors.white)),
          ),
        ]))));
  }
}
