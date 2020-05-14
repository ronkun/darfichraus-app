import 'package:crimsy/utils/sharedPreferencesHelper.dart';
import 'package:flutter/material.dart';

class ChangeEmailForm extends StatefulWidget {
  @override
  _ChangeEmailFormState createState() => new _ChangeEmailFormState();
}

class _ChangeEmailFormState extends State<ChangeEmailForm> {
  final emailFormController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailFormController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _showDialog();
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

  _showDialog() {
    return new AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7)),
        title: new Text('E-Mail Adresse ändern', style: TextStyle(color: Colors.black, fontSize: 18.0, fontStyle: FontStyle.normal)),
        content: Row(
            children: [
              new Expanded(
                child: new TextField(
                  controller: emailFormController,
                  autofocus: true,
                  decoration: new InputDecoration(
                      labelText: 'E-Mail:', hintText: "E-Mail Adresse eingeben"),
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
            onPressed: () async {
              PreferencesHelper.setString("eMail", emailFormController.text);
              Navigator.of(context).pop();
            }
          )],
      );
    }                      
}