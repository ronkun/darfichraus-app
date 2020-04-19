import 'package:crimsy/model/restriction_model.dart';
import 'package:flutter/material.dart';

class FeedDetailView extends StatelessWidget {

 FeedDetailView();

  @override
  Widget build(BuildContext context) {
    Restriction data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
                elevation: 0.1,
              backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
              title: Text(""),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.list),
                  onPressed: () {},
                )
              ],
        // title: Text(data.restrictionShortDescription),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(data.restrictionType),
      ),
    );
  }
  
}