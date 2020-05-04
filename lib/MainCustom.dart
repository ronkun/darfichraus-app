import 'package:crimsy/MainDrawer.dart';
import 'package:crimsy/widgets/advisor/AdvisorArticles.dart';
import 'package:crimsy/widgets/advisor/AdvisorBoard.dart';
import 'package:crimsy/widgets/advisor/pages/advisorHome.dart';
import 'package:crimsy/widgets/feed/MainFeed.dart';
import 'package:crimsy/widgets/map/Map.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final Widget title; 

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  Widget _bodyWidget = WidgetAdvisorBoard();

  // final _navigatorKey = GlobalKey<NavigatorState>();

  final List<Widget> _children = [
    HomePage(),
    WidgetMainfeed(),
    WidgetMap(),
    WidgetAdvisorArticles()
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
      //   appBar: PreferredSize(
      //   preferredSize: Size(double.infinity, 100),
      //   child: Container(
      //     decoration: BoxDecoration(
      //       boxShadow: [BoxShadow(
      //         color: Colors.black12,
      //         spreadRadius: 5,
      //         blurRadius: 2
      //       )]
      //     ),
      //     width: MediaQuery.of(context).size.width,
      //     height: 100,
      //     child: Container(
      //       decoration: BoxDecoration(
      //         color: Colors.blueAccent,
      //         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
      //       ),
      //       child: Container(
      //         margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Icon(Icons.navigate_before,size: 40,color: Colors.white,),
      //             Text("Foodbar",style: TextStyle(fontSize: 30,color: Colors.white),),
      //             Icon(Icons.navigate_before,color: Colors.transparent,),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
  
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
            title: Text('Übersicht'),
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