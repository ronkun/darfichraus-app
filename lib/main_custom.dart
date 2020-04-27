import 'package:crimsy/main_drawer.dart';
import 'package:crimsy/widgets/feed/widget_mainfeed.dart';
import 'package:crimsy/widgets/map/widget_map.dart';
import 'package:crimsy/widgets/settings/widget_settings.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final Widget title; 

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  // final _navigatorKey = GlobalKey<NavigatorState>();

  final List<Widget> _children = [
    WidgetMainfeed(),
    WidgetMap(),
    WidgetMap(),
    WidgetSettings()
  ];
  
  // final List<String> _children = [
  //   WidgetMainfeed.routeId,
  //   WidgetMap.routeId,
  //   WidgetMap.routeId,
  //   WidgetSettings.routeId
  // ];

  void _onTabTapped(int index) {
    setState(() {
      // _navigatorKey.currentState.pushNamed('/'yourRouteName'');
      _selectedIndex = index;
      // Navigator.of(context).pushNamed(_children.elementAt(index));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Text(widget.title),
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
            // new DropdownButton<String>(
            //   value: _value,
            //   icon: Icon(Icons.filter_list),
            //   items: <DropdownMenuItem<String>>[
            //     new DropdownMenuItem(
            //       child: new Text('My Page'),
            //       value: 'one',
            //     ),
            //   ], 
            //   onChanged: (String value) {
            //     setState(() => _value = value);
            //   },
            // ),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {},
            ),
          ]
        ),
        drawer: MainDrawer(),
        body: _children.elementAt(_selectedIndex), // new
        bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped, // new
        currentIndex: _selectedIndex, 
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
        mini: true,
      ), 
    );
  }
}