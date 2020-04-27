import 'package:crimsy/model/restriction_model.dart';
import 'package:flutter/material.dart';
import 'package:crimsy/service/post_service.dart';

class WidgetSettings extends StatefulWidget {
  static const String routeId = 'settings';

  @override
  _WidgetSettingsState createState() => _WidgetSettingsState();
}

class _WidgetSettingsState extends State<WidgetSettings> {
  Future<List<Restriction>> _restrictions;
  Future<List<Restriction>> filteredRestrictions;
  bool _IsSearching;
  // WidgetMainfeed();
  // @override
  // void initState() {
  //   getRestrictions().then((data) {
  //     setState(() {
  //       restrictions = filteredRestrictions = data;
  //     });
  //   });
  //   super.initState();
  // }


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
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Verordnungen durchsuchen',
              prefixIcon: Icon(Icons.search),
            ),
            // onSubmitted: ,
          ),
        ]
          )
      );
    }
}
 