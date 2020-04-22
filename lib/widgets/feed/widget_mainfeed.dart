import 'package:crimsy/model/restriction_model.dart';
import 'package:crimsy/utility.dart';
import 'package:crimsy/widgets/feed/widget_mainfeed_detailview.dart';
import 'package:flutter/material.dart';
import 'package:crimsy/service/post_service.dart';

class WidgetMainfeed extends StatefulWidget {
  @override
  _WidgetMainfeedState createState() => _WidgetMainfeedState();
}

class _WidgetMainfeedState extends State<WidgetMainfeed> {

  AsyncSnapshot<List<Restriction>> restrictions;
  AsyncSnapshot<List<Restriction>> filteredRestrictions;
  bool isSearching = false;
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
          Expanded(
            child: 
              FutureBuilder<List<Restriction>>(
                future: getAllRestrictions(),
                builder: (context, snapshot) {
                  restrictions = snapshot;
                  switch (restrictions.connectionState) {
                    case ConnectionState.none:       
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                          return Utility.getCircularProgressIndicator(50.0, 50.0);
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text('Error: ${restrictions.error}');
                      } else if(restrictions.hasData) {
                        return ListView.builder(
                          itemCount: restrictions.data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: new CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: restrictions.data[index].translateRestrictionAreaSymbol(restrictions.data[index].restrictionArealIdentifier)
                                  ),        
                              title: Text(restrictions.data[index].restrictionShortDescription),
                              subtitle: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Icon(
                                      Utility.getIconForCategory(restrictions.data[index].restrictionType), 
                                      color: Colors.grey,
                                      size: 15.0,
                                    )
                                  ),
                                    Text(Utility.formatDateTime(restrictions.data[index].restrictionStart), style: TextStyle(color: Colors.grey)
                                  )
                                ]),
                              // Text('ID: ${snapshot.data[index].restrictionId} '),
                              enabled: restrictions.data[index].restrictionDescription.isNotEmpty,
                              trailing: Icon(Icons.keyboard_arrow_right),
                              dense: true,
                              onTap:() => Navigator.push(context, 
                                MaterialPageRoute(
                                  builder: (context) => FeedDetailView(),
                                   settings: RouteSettings(
                                    arguments: restrictions.data[index],
                                  ),
                                ),
                             ));
                          });
                        } else {
                          return Utility.getCircularProgressIndicator(50.0, 50.0);
                          // return CircularProgressIndicator();
                        }
                    }
                },)
              )
            ]
          )
        );
    }
}
 