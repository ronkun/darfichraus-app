import 'package:crimsy/main_drawer.dart';
import 'package:crimsy/widgets/feed/mainfeed.dart';
import 'package:crimsy/widgets/map/map.dart';
import 'package:crimsy/widgets/settings/settings.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final Widget title; 

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  Widget _bodyWidget = WidgetMainfeed();

  // final _navigatorKey = GlobalKey<NavigatorState>();

  final List<Widget> _children = [
    WidgetSettings(),
    WidgetMainfeed(),
    WidgetMap(),
    WidgetSettings()
  ];

  void _onTabTapped(int index) {
    setState(() {
      // _navigatorKey.currentState.pushNamed('/'yourRouteName'');
      // Navigator.of(context).pushNamed(_children.elementAt(index));
      _selectedIndex = index;
      _setWidgetForBody(index);
    });
  }

  void _setWidgetForBody(int index) {
    setState(() {
          _bodyWidget = _children.elementAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 55),
            child: widget.title,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.bookmark),
              onPressed: () {
                Navigator.of(context).pushNamed('first');
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                setState(() {
                  _setWidgetForBody(3);
                });
              },
            ),
          ]
        ),
        drawer: MainDrawer(),
        body: _bodyWidget,
        bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped, // new
        currentIndex: _selectedIndex, 
        type: BottomNavigationBarType.fixed,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Übersicht')
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            title: Text('News'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Karte'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            title: Text('Advisor')
          )
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("Verordnung hinzufügen");
        },
        tooltip: 'Verordnung hinzufügen',
        child: Icon(Icons.add),
        mini: true,
      ), 
    );
  }
}