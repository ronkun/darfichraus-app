import 'package:crimsy/widget_mainfeed.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title; 

  @override
  State<StatefulWidget> createState() {
      return _HomeState();
    }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
 final List<Widget> _children = [
   WidgetMainfeed(Colors.white),
   WidgetMainfeed(Colors.deepOrange),
   WidgetMainfeed(Colors.green),
   WidgetMainfeed(Colors.green)
 ];

@override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(widget.title),
     ),
     body: _children[_currentIndex], // new
     bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped, // new
       currentIndex: _currentIndex, // new
       type: BottomNavigationBarType.fixed,
       items: [
         new BottomNavigationBarItem(
           icon: Icon(Icons.home),
           title: Text('News'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.map),
           title: Text('Karte'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('Profil')
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.settings),
           title: Text('Einstellungen')
         )
       ],
     ),

    floatingActionButton: FloatingActionButton(
      onPressed: (){
        print("Verordnung hinzufügen");
      },
      tooltip: 'Verordnung hinzufügen',
      child: Icon(Icons.add),
    ), 
   );
 }

 void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
}