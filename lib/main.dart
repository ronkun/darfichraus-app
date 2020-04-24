import 'package:crimsy/init_screen.dart';
import 'package:flutter/material.dart';
import 'package:crimsy/main_custom.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(MyApp());
int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'darfichraus?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: 'Playfair',
        
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
      initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
      routes: {
        '/': (context) => Home(title: Image.asset('assets/logo/Logo_darf-ich-raus-edit.png', fit: BoxFit.cover, width: 150, height: 50)),
        "first": (context) => OnboardingScreen(),
      },
      // home: Home(title: Image.asset('assets/logo/Logo_darf-ich-raus-edit.png', fit: BoxFit.cover, width: 150, height: 50))
      //home: Home(title: 'darfichraus.de'),
    );
  }
}