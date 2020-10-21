import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CompleteProf extends StatefulWidget {
  @override
  _CompleteProfState createState() => _CompleteProfState();
}

class _CompleteProfState extends State<CompleteProf> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String dropdownValue = 'Choose your Class Level';
  String classlevel = "";
  String school = "";
  

  TextEditingController _textEditingController = new TextEditingController();
  List<String> _values = new List();
  List<bool> _selected = new List();

  @override
  void dispose() {
    _textEditingController?.dispose();
    super.dispose();
  }

  Widget buildChips() {
    List<Widget> chips = new List();

    for (int i = 0; i < _values.length; i++) {
      InputChip actionChip = InputChip(
        selected: _selected[i],
        label: Text(_values[i]),
        onPressed: () {
          setState(() {
            _selected[i] = !_selected[i];
          });
        },
        onDeleted: () {
          _values.removeAt(i);
          _selected.removeAt(i);

          setState(() {
            _values = _values;
            _selected = _selected;
          });
        },
      );

      chips.add(actionChip);
    }

    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complete Profile')),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 60),
              TextField(
                onChanged: (text) {
                  school = text;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'High School/College name',
                ),
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.teal[300]),
                underline: Container(
                  height: 2,
                  color: Colors.teal[300],
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                    classlevel = dropdownValue;
                  });
                },
                items: <String>[
                  'Choose your Class Level',
                  'Freshman',
                  'Sophomore',
                  'Junior',
                  'Senior'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Container(
                height: 30,
                child: buildChips(),
              ),
              TextFormField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  labelText: 'Enter your subjects',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: RaisedButton(
                  onPressed: () {
                    _values.add(_textEditingController.text);
                    _selected.add(true);
                    _textEditingController.clear();

                    setState(() {
                      _values = _values;
                      _selected = _selected;
                    });
                  },
                  child: Text('Choose this subject'),
                ),
              ),
              const SizedBox(height: 140),
              FlatButton(
                color: Colors.teal[300],
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                onPressed: () {
                  var docRef =
                  firestore.collection("users").doc(auth.currentUser.uid);

                  Map<String, dynamic> map = {"grade": classlevel, "highSchool": school, "subjects": _values};
                  docRef.set(map);
                  /*...*/
                },
                child: Text(
                  "Submit my profile",
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
