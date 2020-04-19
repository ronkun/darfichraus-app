import 'package:crimsy/model/restriction_model.dart';
import 'package:flutter/material.dart';

class FeedDetailView extends StatelessWidget {
  final Restriction data;

 FeedDetailView(this.data);

  @override
  Widget build(BuildContext context) {
     // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(data.restrictionShortDescription),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(data.restrictionDescription),
      ),
    );
  }
  
}