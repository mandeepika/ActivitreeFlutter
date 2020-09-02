import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  Dashboard createState() => Dashboard();
}

class Dashboard extends State<MyStatefulWidget> {
  bool _isSelected = false;
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
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.mood),
                  title: Text('\nKitchen Towel Calculus!'),
                  
                  subtitle:
                      Text('\n Topics Covered: Disk and Washer Method \n (and the many interesting uses of kitchen items!)'),
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
                    Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.mood),
                  title: Text('\nRecommended: Integration Review'),
                  
                  subtitle:
                      Text('\nTopics Covered: Disk and Washer Method \nPractice Set'),
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
          const SizedBox(height: 20),
          Text ("TO DO LIST"),
          const SizedBox(height: 20),
          LabeledCheckbox(
      label: 'Eat potato',
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      value: _isSelected,
      onChanged: (bool newValue) {
        setState(() {
          _isSelected = newValue;
        });
      },
    )
        ]))));
  }

}
