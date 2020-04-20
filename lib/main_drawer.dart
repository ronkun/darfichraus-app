import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'darfichraus?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Ort hinzufügen',
                prefixIcon: Icon(Icons.add),
              ),
            ),
            // Divider(),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Essen'),
              trailing: Icon(Icons.keyboard_arrow_right),
              dense: true,
              enabled: true,
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('München'),
              trailing: Icon(Icons.keyboard_arrow_right),
              dense: true,
              enabled: true,
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Berlin'),
              trailing: Icon(Icons.keyboard_arrow_right),
              dense: true,
              enabled: true,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Über uns'),
              trailing: Icon(Icons.keyboard_arrow_right),
              dense: true,
              enabled: true,
            ),
            ListTile(
              leading: Icon(Icons.tag_faces),
              title: Text('Feedback '),
              trailing: Icon(Icons.keyboard_arrow_right),
              dense: true,
              enabled: true,
            ),
          ],
        ),
      );
  }
}