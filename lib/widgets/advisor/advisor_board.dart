import 'package:crimsy/model/restriction_model.dart';
import 'package:flutter/material.dart';
import 'package:crimsy/service/post_service.dart';

class WidgetAdvisorBoard extends StatefulWidget {
  static const String routeId = 'feed';

  @override
  _WidgetAdvisorBoardState createState() => _WidgetAdvisorBoardState();
}

class _WidgetAdvisorBoardState extends State<WidgetAdvisorBoard> {

  Future<List<Restriction>> _restrictions;
  Future<List<Restriction>> filteredRestrictions;

  @override
  void initState() {
    super.initState();
    _restrictions = getAllRestrictions();
  }

    //  void _filterRestrictions(value) {
    //   setState(() {
    //     filteredRestrictions = restrictions
    //         .where((country) =>
    //             country['name'].toLowerCase().contains(value.toLowerCase()))
    //         .toList();
    //   });
    // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

        Column(
            children: <Widget>[
              Text("jjlk")
            ],
          )
        );
      }
}
 