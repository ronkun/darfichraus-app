import 'package:crimsy/utils/utility.dart';
import 'package:flutter/material.dart';

class SubscribeForm extends StatefulWidget {
  @override
  _SubscribeFormState createState() => new _SubscribeFormState();
}

class _SubscribeFormState extends State<SubscribeForm> {
  var _regions = [
    "Schleswig-Holstein",
  ];

  final emailFormController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailFormController.dispose();
    super.dispose();
  }

 @override
  void initState() {
    PreferencesHelper.getString("eMail").then((value) {
        setState(() {
          emailFormController.text = value;
        });
      }
    );
    super.initState();
  }

  String _selectedRegion;

  @override
  Widget build(BuildContext context) {
    return _showDialog();
  }

  _showDialog() {
    return new AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7)),
        title: new Text('Abonnieren', style: TextStyle(color: Colors.black, fontSize: 18.0, fontStyle: FontStyle.normal)),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                Text("Zum Abonnieren fülle bitte das folgende Formular aus und wir senden Dir bei neuen Meldungen eine E-Mail. ",
                style: TextStyle(fontSize: 14)),
                SizedBox(height: 10),
                new TextFormField(
                  autofocus: true,
                  decoration: new InputDecoration(
                      labelText: 'Name:', hintText: 'Name eingeben'),
                ),
                new TextFormField(
                    autofocus: true,
                    controller: emailFormController,
                    decoration: new InputDecoration(
                        labelText: 'E-Mail:', hintText: 'E-Mail Adresse eintragen'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Bitte gib eine E-Mail Adresse ein';
                      }
                      return null;
                    },  
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
                      ),
                ),
          ]
        )),
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
              Navigator.of(context).pop();
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