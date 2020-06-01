                
import 'package:crimsy/utils/colors.dart';
import 'package:flutter/material.dart';

class AdvisorSymptomsWidget extends StatelessWidget {
  final String feedLabel;

  const AdvisorSymptomsWidget({
    Key key,
    this.feedLabel="texte",
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.sms_failed, size: 50, color: MainColors.dirMainBlue),
                  title: Text('Symptome'),
                  subtitle: Text('Die Symptome von Corona.'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          );
      }
} 
                
            