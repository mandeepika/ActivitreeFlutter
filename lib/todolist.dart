import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Following Karan Verma's documentation on Medium.com
//https://github.com/hydroweaver/medium_wip_todo/blob/master/lib/main.dart
//Also folowing Gearóid M's documentation on Medium.com
//https://medium.com/the-web-tub/making-a-todo-app-with-flutter-5c63dab88190
//https://stackoverflow.com/questions/56953911/flutter-trouble-with-multiselect-checkboxes-data-from-firestore/56956573#56956573

class ToDoList extends StatefulWidget {
  ToDoList({Key key, this.title, this.onLongPress}) : super(key: key);
  final String title;
  final Function onLongPress;

  @override
  Test createState() => Test();
}

class Test extends State<ToDoList> {
final firestoreInstance = Firestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<String> items = [];

  // This will be called each time the + button is pressed
  void _addTodoItem(String task) {
    // Putting our code inside "setState" tells the app that our state has changed, and
    // it will automatically re-render the list
    if (task.length > 0) {
      setState(() => items.add(task));
    }
  }

// Much like _addTodoItem, this modifies the array of todo strings and
// notifies the app that the state has changed by using setState
  void _removeTodoItem(int index) {
    setState(() => items.removeAt(index));
  }

  // Show an alert dialog asking the user to confirm that the task is done
  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text('Remove "${items[index]}"?'),
              actions: <Widget>[
                new FlatButton(
                    child: new Text('CANCEL'),
                    onPressed: () => Navigator.of(context).pop()),
                new FlatButton(
                    child: new Text('REMOVE'),
                    onPressed: () {
                      _removeTodoItem(index);
                      _onRemove(items.elementAt(index));
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  // Build the whole list of todo items
  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        // itemBuilder will be automatically be called as many times as it takes for the
        // list to fill up its available space, which is most likely more than the
        // number of todo items we have. So, we need to check the index is OK.
        if (index < items.length) {
          return _buildTodoItem(items[index], index);
        }
      },
    );
  }

  // Build a single todo item
  Widget _buildTodoItem(String todoText, int index) {
    return new CheckTile(
        title: Text(todoText),

        //     );

        // ListTile(
        //   title: new Text(todoText),
        onLongPress: () => _promptRemoveTodoItem(index));
  }

  void _pushAddToDoScreen() {
    // Push this page onto the stack
    Navigator.of(context).push(
        // MaterialPageRoute will automatically animate the screen entry, as well
        // as adding a back button to close it
        new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(title: new Text("Let's do this!")),
          body: new TextField(
            autofocus: true,
            onSubmitted: (val) {
              _onSubmitted(val);
              _addTodoItem(val);
              Navigator.pop(context); // Close the add todo screen
            },
            decoration: new InputDecoration(
                hintText: 'Add a new task',
                contentPadding: const EdgeInsets.all(16.0),
                helperText: 'Select and hold to remove task from list'),
          ));
    }));
  }

//added val parameter to take to do array value from add to do screen
    void _onSubmitted(val) async {
    var firebaseUser = await auth.currentUser.uid;
    firestoreInstance
        .collection("users")
        .document(auth.currentUser.uid)
        .updateData({
      "To Do Items": FieldValue.arrayUnion([val])
    }).then((_) {
      print("success!");
    });
  }
  void _onRemove(elementIndexItem) async{
  var firebaseUser = await auth.currentUser.uid;
  firestoreInstance.collection("users").document(auth.currentUser.uid).updateData({
  "To Do Items" : elementIndexItem.delete()
    }).then((_) {
    print("success!");
  });
}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(title: Text("To Do List")),
        resizeToAvoidBottomInset: false,
        body: _buildTodoList(),
        floatingActionButton: new FloatingActionButton(
            onPressed: _pushAddToDoScreen,
            //onPressed: _onPressed,
            tooltip: 'Add task',
            child: new Icon(Icons.add)
            // body: ReorderableListView(
            //   children: <Widget>[

            //     for (var item in items)
            //       CheckboxListTile(
            //         value: toggle,
            //         onChanged: (bool) {
            //           setState(() {
            //             if (!bool) {
            //               toggle = false;
            //             } else {
            //               toggle = true;
            //             }
            //           });
            //         },
            //         key: Key(item),
            //         title: _strikeThrough(todoText: item, todoToggle: toggle),
            //       ),
            //   ],
            //   onReorder: (OldIndex, NewIndex) {
            //     setState(() {
            //       if (OldIndex < NewIndex) {
            //         NewIndex -= 1;
            //       }
            //       var getReplacedWidget = items.removeAt(OldIndex);
            //       items.insert(NewIndex, getReplacedWidget);
            //     });
            //   },
            // ),
            ));
  }
}

//bool toggle = false;

// class _strikeThrough extends StatelessWidget {
//   bool todoToggle;
//   String todoText;
//   _strikeThrough({this.todoToggle, this.todoText}) : super();

//   Widget _strikewidget() {
//     if (todoToggle == false) {
//       return Text(
//         todoText,
//         style: TextStyle(fontSize: 22.0),
//       );
//     } else {
//       return Text(
//         todoText,
//         style: TextStyle(
//             fontSize: 22.0,
//             decoration: TextDecoration.lineThrough,
//             color: Colors.teal[300],
//             fontStyle: FontStyle.italic),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _strikewidget();
//   }
// }

class CheckTile extends StatefulWidget {
  final Text title;
  final Function onLongPress;

  CheckTile({this.title, this.onLongPress});

  @override
  Check createState() => Check();
}

class Check extends State<CheckTile> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: widget.title,
      onLongPress: widget.onLongPress,
      trailing: Checkbox(
          value: selected,
          onChanged: (bool val) {
            setState(() {
              selected = val;
            });
          }),
    );
  }
}
