import 'package:flutter/material.dart';

class SubscribeForm extends StatefulWidget {
  @override
  _SubscribeFormState createState() => new _SubscribeFormState();
}

class _SubscribeFormState extends State<SubscribeForm> {
  var _regions = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];

  String _selectedRegion;

  @override
  Widget build(BuildContext context) {
    return _showDialog();
  }

  _showDialog() {
    return new AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7)),
        title: new Text('Abonnieren', style: TextStyle(color: Colors.black, fontSize: 18.0, fontStyle: FontStyle.normal)),
        content: Column(
            children: [
              // new Expanded(
              //   child: 
                new TextField(
                  autofocus: true,
                  decoration: new InputDecoration(
                      labelText: 'Name:', hintText: 'Hans Wurst'),
                ),
              // ),
              // new Expanded(
              //     child:
                   new TextField(
                    autofocus: true,
                    decoration: new InputDecoration(
                        labelText: 'E-Mail:', hintText: 'hanswurst@keincorona.virus'),
                ),
                new DropdownButtonFormField(
                  onChanged: (newValue) {
                    // do other stuff with _category
                    setState(() => _selectedRegion = newValue);
                  },
                  items: _regions.map((String category) {
                    return new DropdownMenuItem(
                      value: category,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.star),
                          Text(category),
                        ],
                      )
                      );
                    }).toList(), 
                    value: _selectedRegion,
                    decoration: InputDecoration(
                      labelText: "Region:",
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: _selectedRegion, 
                        // errorText:  "Keine Auswahl",
                      ),
                ),
            // )
          ]
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("Abbrechen"),
            onPressed: () {
              Navigator.of(context).pop();
            }
          ),
          FlatButton(
            child: Text("Abonnieren"),
            onPressed: () {
            // yourFunction();
            }
          )
        ],
      );
    }                      
}


// class _SystemPadding extends StatelessWidget {
//   final Widget child;

//   _SystemPadding({Key key, this.child}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var mediaQuery = MediaQuery.of(context);
//     return new AnimatedContainer(
//         padding: mediaQuery.viewInsets,
//         duration: const Duration(milliseconds: 300),
//         child: child);
//   }
// }