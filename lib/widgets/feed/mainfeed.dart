import 'package:crimsy/model/restriction_model.dart';
import 'package:crimsy/service/restriction_service.dart';
import 'package:crimsy/utils/utility.dart';
import 'package:crimsy/widgets/feed/mainfeedDetails.dart';
import 'package:flutter/material.dart';

class WidgetMainfeed extends StatefulWidget {
  static const String routeId = 'feed';

  @override
  _WidgetMainfeedState createState() => _WidgetMainfeedState();
}

class _WidgetMainfeedState extends State<WidgetMainfeed> {
  Future<List<Restriction>> _restrictions;
  Future<List<Restriction>> filteredRestrictions;
  int restrictionsCount = 0;

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
  // _restrictions = getAllRestrictions();
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
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10, top: 10),
              child: 
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: 'Verordnungen durchsuchen',
                  prefixIcon: Icon(Icons.search),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue[800]),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue[800]),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                ),
                // onSubmitted: ,
              )
            ),
            Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                    child: 
                    Text(
                        restrictionsCount.toString() + " Verordnungen verfügbar",
                        style: TextStyle(color: Colors.lightBlue[800], fontSize: 11.0, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            Expanded(
              child: 
                FutureBuilder<List<Restriction>>(
                  future: getAllRestrictions(),
                  builder: (context, snapshot) {
                    // print();
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:       
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Utility.getCircularProgressIndicator(50.0, 50.0);
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if(snapshot.hasData) {
                          return ListView.builder(
                            //itemCount: filtered.length
                          //  SchedulerBinding.instance.addPostFrameCallback((_) => setState(() {
                          //   restrictionsCount = snapshot.data.length;
                          //  })));
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return 
                              // Card( 
                              //   child: 
                                Padding(
                                  padding: EdgeInsets.only(bottom: 3),
                                  child: ListTile(
                                leading: new CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: snapshot.data[index].translateRestrictionAreaSymbol(snapshot.data[index].restrictionArealIdentifier)
                                    ),        
                                title: Text(snapshot.data[index].restrictionShortDescription, style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w600, color: Colors.black87)),
                                subtitle: Column(children: <Widget> [
                                  // SizedBox(height: 2),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(right: 8),
                                        child: Icon(
                                          Utility.getIconForCategory(snapshot.data[index].restrictionType), 
                                          color: Colors.grey,
                                          size: 15.0,
                                        )
                                      ),
                                        Text(Utility.formatDateTime(snapshot.data[index].restrictionStart), style: TextStyle(color: Colors.grey)
                                      )
                                    ])
                                  ]),
                                // Text('ID: ${snapshot.data[index].restrictionId} '),
                                enabled: snapshot.data[index].restrictionDescription.isNotEmpty,
                                trailing: Icon(Icons.keyboard_arrow_right),
                                dense: true,
                                onTap:() => Navigator.push(context, 
                                  MaterialPageRoute(
                                    builder: (context) => FeedDetailView(),
                                    settings: RouteSettings(
                                      arguments: snapshot.data[index],
                                    ),
                                  ),
                              )));
                            });
                          } else {
                            return Utility.getCircularProgressIndicator(50.0, 50.0);
                          }
                      }
                  },)
                )
              ]
            )
          )
        );
    }
}
 