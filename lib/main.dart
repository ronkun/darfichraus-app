import 'package:flutter/material.dart';
import 'package:crimsy/main_custom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'darfichraus?',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        // brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.lightBlue[600],

        // Define the default font family.
        // fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          // body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: Home(title: Image.asset('assets/logo/Logo_darf-ich-raus.png', fit: BoxFit.cover))
      //home: Home(title: 'darfichraus.de'),
    );
  }
}