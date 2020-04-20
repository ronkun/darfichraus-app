import 'package:flutter/material.dart';
import 'package:crimsy/main_custom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'darfichraus?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Playfair',
        
        // primarySwatch: Colors.blue,
        // brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.lightBlue[600],

        // Define the default font family.
        // fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, fontFamily: 'Playfair'),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, fontFamily: 'Playfair'),
          // body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: Home(title: Image.asset('assets/logo/Logo_darf-ich-raus-edit.png', fit: BoxFit.cover, width: 150, height: 50))
      //home: Home(title: 'darfichraus.de'),
    );
  }
}