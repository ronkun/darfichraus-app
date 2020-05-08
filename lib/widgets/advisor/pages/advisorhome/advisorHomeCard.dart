import 'package:crimsy/utils/colors.dart';
import 'package:flutter/material.dart';

class GlobalSituationCard extends StatelessWidget {
  final String cardTitle;
  final String caseTitle;
  final int currentData;
  final int newData;
  final double percentChange;
  final Icon icon;
  final Color color;
  final Color cardColor;

  const GlobalSituationCard(
      {Key key,
      @required this.cardTitle,
      @required this.caseTitle,
      @required this.currentData,
      @required this.newData,
      @required this.percentChange,
      this.icon,
      this.cardColor = CardColors.green,
      @required this.color})
      : super(key: key);
      
  @override
  Widget build(BuildContext context) {
    // final formatter = new NumberFormat("#,###");

    return Stack(
      children: <Widget>[
          Text("data")
        ],
    );
  }
}