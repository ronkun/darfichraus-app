import 'package:crimsy/widgets/advisor/objects/advisorCardObject.dart';
import 'package:crimsy/widgets/advisor/pages/advisorhome/advisorCardCrisisTileDetails.dart';
import 'package:flutter/material.dart';

class AdvisorCardCrisisTile extends StatelessWidget {
  final String crisisTitle;
  final List<Image> crisisRestrictionsIcons;
  final AdvisorCardObject advisorCardObject;

  const AdvisorCardCrisisTile({
    Key key,
    this.crisisTitle,
    this.crisisRestrictionsIcons,
    this.advisorCardObject,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return   
      Container(
          height: 60, 
            child: Card(
              color: Colors.white70,
              child: ListTile(
                leading: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(crisisTitle, style: TextStyle(fontWeight: FontWeight.bold)), 
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 10,),
                title: Row(
                  // children: <Widget>[
                    children:
                      List.generate(crisisRestrictionsIcons.length,(index){ 
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.withAlpha(70), style: BorderStyle.solid, width: 1.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: crisisRestrictionsIcons[index],
                            // Icon(Icons.accessibility),
                          ),
                        );
                      }),
                    ),  
                                            //  InkWell(
                      onTap: () =>
                      //  print(crisisRestrictionsIcons),
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => DetailPage(advisorCardObject: advisorCardObject, restrictionIcons: crisisRestrictionsIcons),
                            transitionDuration: Duration(milliseconds: 1000),
                          ),
                        ),            
              ) 
            ),
          );
        }
}