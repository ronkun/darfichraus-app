import 'package:crimsy/utils/colors.dart';
import 'package:crimsy/utils/customIcons.dart';
import 'package:crimsy/widgets/advisor/objects/advisorCardObject.dart';
import 'package:crimsy/widgets/advisor/pages/advisorhome/advisorCardCrisisTileDetails.dart';
import 'package:crimsy/widgets/advisor/pages/advisorhome/advisorCardProgressBar.dart';
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
          ListTile(
            leading: RestrictionIcons.Mask, 
            title: 
            GestureDetector(
              onTap: () { 
                
               },
              child: Text('Maskenpflicht', style: TextStyle(fontSize: 13)),
            ), 
            dense: true, 
            subtitle: AdvisorProgressBar(
              totalSteps: 5,
              currentStep: 2,
              padding: 1.0,
              size: 2,
              // uuid: this.advisorCardObject.uuid,
              showLabel: false,
            ),
          ),
          ListTile(
            leading: RestrictionIcons.Distance, 
            title:            
            GestureDetector(
              onTap: () { 

               },
              child: Text('Kontaktverbot', style: TextStyle(fontSize: 13)),
            ), 
            dense: true, 
            subtitle: AdvisorProgressBar(
              totalSteps: 5,
              currentStep: 4,
              padding: 1.0,
              size: 2,
              // uuid: this.advisorCardObject.uuid,
              showLabel: false,
            ),
          ),
      ],
    );
  }
}