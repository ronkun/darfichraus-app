import 'package:flutter/material.dart';

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return new Text("test");
  }
}