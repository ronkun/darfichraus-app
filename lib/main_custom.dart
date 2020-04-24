import 'package:crimsy/main_drawer.dart';
import 'package:crimsy/widgets/feed/widget_mainfeed.dart';
import 'package:crimsy/widgets/map/widget_map.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final Widget title; 

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    WidgetMainfeed(),
    WidgetMap(),
    WidgetMap(),
    WidgetMap()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Text(widget.title),
          title: widget.title,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.bookmark),
              onPressed: () {
                Navigator.pushNamed(context, 'first');
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