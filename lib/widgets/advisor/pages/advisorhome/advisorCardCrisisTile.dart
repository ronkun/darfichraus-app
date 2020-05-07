import 'package:flutter/material.dart';

class AdvisorCardCrisisTile extends StatelessWidget {
  final String crisisTitle;
  final List<Image> crisisRestrictionsIcons;

  const AdvisorCardCrisisTile({
    Key key,
    this.crisisTitle,
    this.crisisRestrictionsIcons,
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
                    )
                    //ICONS TO SHOW IN BL
  

                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     shape: BoxShape.circle,
                    //     border: Border.all(color: Colors.grey.withAlpha(70), style: BorderStyle.solid, width: 1.0),
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.all(8.0),
                    //     child: Image(image: AssetImage('assets/corona_icons/iconfinder_viral-coronavirus-intect-host-human_5728207.png'), height: 24),
                    //     // Icon(Icons.accessibility),
                    //   ),
                    // ),





                
              ) 
            ),
          );
        }
}