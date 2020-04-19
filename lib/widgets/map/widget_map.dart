import 'package:flutter/material.dart';

class WidgetMap extends StatelessWidget {
  final color;
  final String buttonLbl = "Karte";

  @override
  Widget build(BuildContext context) {
    
    return Text("Das wird eine Map");
  }

  String getButtonLbl () {
    return buttonLbl;
  }

  WidgetMap(this.color);
}

