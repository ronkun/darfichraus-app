import 'package:crimsy/init_screen.dart';
import 'package:crimsy/widgets/feed/mainfeed.dart';
import 'package:crimsy/widgets/map/map_mb.dart';
import 'package:crimsy/widgets/settings/settings.dart';
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
  // print('initScreen ${initScreen}');
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
        primaryColor: Color(0xFF01364d),
        // primaryColor: Colors.lightBlue[800],
        // accentColor: Colors.lightBlue[600],
        accentColor: Color(0xFF01364d),
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        ),
      ),
      initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
      routes: {
        // '/': (context) => Home(title: Image.asset('assets/logo/Logo_darf-ich-raus-edit.png', fit: BoxFit.cover, width: 150, height: 50)),
        OnboardingScreen.routeId: (context) => OnboardingScreen(),
        "settings": (context) => WidgetSettings(),
        "map": (context) => WidgetMap(),
        "feed": (context) => WidgetMainfeed()
      },
      home: Home(title: Image.asset('assets/logo/logo_dir_0520.png', fit: BoxFit.cover)),
    );
  }
}