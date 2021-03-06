import 'package:crimsy/widgets/drawer/mainDrawer.dart';
import 'package:crimsy/subscribeForm.dart';
import 'package:crimsy/widgets/advisor/pages/advisorhome/advisorHome.dart';
import 'package:crimsy/widgets/advisor/pages/advisorreferences/advisorReferences.dart';
import 'package:crimsy/widgets/feed/MainFeed.dart';
import 'package:crimsy/widgets/map/Map.dart';
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
  Widget _bodyWidget = AdvisorHome();

  final List<Widget> _children = [
    AdvisorHome(),
    WidgetMainfeed(),
    WidgetMap(),
    WidgetAdvisorArticles(),
    WidgetSettings(),
  ];

  void _onTabTapped(int index) {
    setState(() {
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
          // shape: CustomShapeBorder(),
          title: Padding(
            padding: EdgeInsets.only(left: 15, right: 45),
            child: widget.title,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.bookmark),
              onPressed: () {
                // Navigator.of(context).pushNamed('subscribe');
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  child: SubscribeForm()
                );            
              },
            ),
            IconButton(
              icon: Icon(Icons.looks_one),
              onPressed: () {
                Navigator.of(context).pushNamed('first');
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                setState(() {
                  _setWidgetForBody(4);
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
            title: Text('Übersicht'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            title: Text('Feed'),
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
      
      /* FLOATING + BUTTON */
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     print("Verordnung hinzufügen");
      //   },
      //   tooltip: 'Verordnung hinzufügen',
      //   child: Icon(Icons.add),
      //   mini: true,
      // ), 
    );
  }
}


/* CUSTOM SHAPE BORDER FOR APPBAR */
// class CustomShapeBorder extends ContinuousRectangleBorder {
//   @override
//   Path getOuterPath(Rect rect, {TextDirection textDirection}) {

//     final double innerCircleRadius = 150.0;

//     Path path = Path();
//     path.lineTo(0, rect.height);
//     path.quadraticBezierTo(rect.width / 2 - (innerCircleRadius / 2) - 130, rect.height + 15, rect.width / 2 - 75, rect.height + 50);
//     path.cubicTo(
//         rect.width / 2 - 40, rect.height + innerCircleRadius - 40,
//         rect.width / 2 + 40, rect.height + innerCircleRadius - 40,
//         rect.width / 2 + 75, rect.height + 50
//     );
//     path.quadraticBezierTo(rect.width / 2 + (innerCircleRadius / 2) + 30, rect.height + 15, rect.width, rect.height);
//     path.lineTo(rect.width, 0.0);
//     path.close();

//     return path;
//   }
// }