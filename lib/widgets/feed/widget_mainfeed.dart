import 'package:crimsy/model/restriction_model.dart';
import 'package:flutter/material.dart';
import 'package:crimsy/service/post_service.dart';

class WidgetMainfeed extends StatelessWidget {
 final Color color;

 WidgetMainfeed(this.color);

callAPI(){
  //post
}
  
 @override
 Widget build(BuildContext context) {
      return FutureBuilder<List<Restriction>>(
        future: getAllRestrictions(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:       
            case ConnectionState.active:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if(snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.warning),
                      title: Text(snapshot.data[index].restrictionShortDescription),
                      subtitle: Text('ID: ${snapshot.data[index].restrictionId} '),
                      enabled: snapshot.data[index].restrictionDescription.isNotEmpty,
                      trailing: Icon(Icons.more_vert),
                      dense: true,
                      onTap: () {
                        print("Tapped");
                      },
                    );
                  });
                } else {
                  return CircularProgressIndicator();
                }
            }
        },
      );
  }
}