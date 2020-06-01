import 'package:crimsy/utils/colors.dart';
import 'package:flutter/material.dart';

class AdvisorFeedWidget extends StatelessWidget {
  final String feedLabel;

  const AdvisorFeedWidget({
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
                leading: Icon(Icons.format_list_bulleted, size: 50, color: MainColors.dirMainBlue),
                title: Text('Feed Artikel'),
                subtitle: Text('228 Artikel gefunden'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        );
      }
} 