import 'package:crimsy/model/restriction_model.dart';
import 'package:crimsy/utility.dart';
import 'package:crimsy/widgets/feed/widget_mainfeed_detailview.dart';
import 'package:flutter/material.dart';
import 'package:crimsy/service/post_service.dart';

class WidgetMainfeed extends StatelessWidget {

WidgetMainfeed();

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
          ),
          Expanded(
            child: 
              FutureBuilder<List<Restriction>>(
                future: getAllRestrictions(),
                builder: (context, snapshot) {
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
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: new CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: snapshot.data[index].translateRestrictionAreaSymbol(snapshot.data[index].restrictionArealIdentifier)
                                  ),        
                              title: Text(snapshot.data[index].restrictionShortDescription),
                              subtitle: Row(
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
 