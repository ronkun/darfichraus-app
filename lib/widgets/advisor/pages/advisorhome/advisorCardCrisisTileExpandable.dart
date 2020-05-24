import 'package:crimsy/utils/colors.dart';
import 'package:crimsy/utils/customIcons.dart';
import 'package:crimsy/widgets/advisor/objects/advisorCardObject.dart';
import 'package:crimsy/widgets/advisor/pages/advisorhome/advisorCardCrisisTileDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandCrisisTile extends StatelessWidget {
  final String crisisTitle;
  final List<Image> crisisRestrictionsIcons;
  final AdvisorCardObject advisorCardObject;
  final bool initiallyExpanded;

  const ExpandCrisisTile({
    Key key,
    this.crisisTitle,
    this.crisisRestrictionsIcons,
    this.advisorCardObject,
    @required this.initiallyExpanded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        backgroundColor: LightColor.cardColor,
        leading: Icon(Icons.bubble_chart),
        title: FlatButton(
          splashColor: MainColors.dirMainBlue,
          textColor: Colors.grey,
          color: Colors.lightBlue[600],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.white)
          ),
          onPressed: () => Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => DetailPage(advisorCardObject: advisorCardObject, restrictionIcons: crisisRestrictionsIcons),
                  transitionDuration: Duration(milliseconds: 1000),
                ),
              ),     
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                crisisTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
      ),
        
      children: <Widget>[
        ListTile(leading: RestrictionIcons.Mask, title: Text('Maskenpflicht'), dense: true),
        ListTile(leading: RestrictionIcons.Distance, title: Text('Kontaktverbot'), dense: true),
      ],
    );
  }
}