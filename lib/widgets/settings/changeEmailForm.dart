import 'package:flutter/material.dart';

class ChangeEmailForm extends StatefulWidget {
  @override
  _ChangeEmailFormState createState() => new _ChangeEmailFormState();
}

class _ChangeEmailFormState extends State<ChangeEmailForm> {
  @override
  Widget build(BuildContext context) {
    return _showDialog();
  }

  _showDialog() {
    return new AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7)),
        title: new Text('E-Mail Adresse ändern', style: TextStyle(color: Colors.black, fontSize: 18.0, fontStyle: FontStyle.normal)),
        content: Row(
            children: [
              new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: new InputDecoration(
                      labelText: 'E-Mail:', hintText: 'hanswurst@keincorona.virus'),
                ),
              )
            ]),
        actions: <Widget>[
          FlatButton(
            child: Text("Schließen"),
            onPressed: () {
              Navigator.of(context).pop();
            }
          ),
          FlatButton(
            child: Text("Speichern"),
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