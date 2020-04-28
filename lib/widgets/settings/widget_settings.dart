import 'package:crimsy/model/restriction_model.dart';
import 'package:flutter/material.dart';
import 'package:crimsy/service/post_service.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_ui_challenges/core/presentation/res/assets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WidgetSettings extends StatefulWidget {
  static const String routeId = 'settings';

  @override
  _WidgetSettingsState createState() => _WidgetSettingsState();
}

class _WidgetSettingsState extends State<WidgetSettings> {
 bool _dark;

  @override
  void initState() { 
    super.initState();
    _dark = false;
  }

  Brightness _getBrightness() {
     return _dark ? Brightness.dark : Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      isMaterialAppTheme: true,
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
        backgroundColor: _dark ? null : Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          brightness: _getBrightness(),
          iconTheme: IconThemeData(color: _dark ? Colors.white : Colors.black),
          backgroundColor: Colors.transparent,
          title: Text(
            'Einstellungen',
            style: TextStyle(color: _dark ? Colors.white : Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.moon),
              onPressed: () {
                setState(() {
                  _dark = !_dark;
                });
              },
            )
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.lightBlue[800],
                    child: ListTile(
                      onTap: () {
                        //open edit profile
                      },
                      title: Text(
                        "Hans Wurst",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(""),
                      ),
                      trailing: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.email,
                            color: Colors.lightBlue[800],
                          ),
                          title: Text("E-Mail Adresse ändern"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change password
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            FontAwesomeIcons.language,
                            color: Colors.lightBlue[800],
                          ),
                          title: Text("Kategorie ändern"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change language
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.location_on,
                            color: Colors.lightBlue[800],
                          ),
                          title: Text("Standort ändern"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change location
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Benachrichtigungseinstellungen",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SwitchListTile(
                    activeColor: Colors.lightBlue[800],
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text("Benachrichtigungen"),
                    onChanged: (val) {},
                  ),
                  SwitchListTile(
                    activeColor: Colors.lightBlue[800],
                    contentPadding: const EdgeInsets.all(0),
                    value: false,
                    title: Text("E-Mail Benachrichtigungen"),
                    onChanged: (val) {},
                  ),
                  SwitchListTile(
                    activeColor: Colors.lightBlue[800],
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text("Newsletter"),
                    onChanged: (val) {},
                  ),
                  SwitchListTile(
                    activeColor: Colors.lightBlue[800],
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text("App Updates"),
                    onChanged: null,
                  ),
                  const SizedBox(height: 60.0),
                ],
              ),
            ),
            // Positioned(
            //   bottom: -20,
            //   left: -20,
            //   child: Container(
            //     width: 80,
            //     height: 80,
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //       color: Colors.purple,
            //       shape: BoxShape.circle,
            //     ),
            //   ),
            // ),
            // Positioned(
            //   bottom: 00,
            //   left: 00,
            //   child: IconButton(
            //     icon: Icon(
            //       FontAwesomeIcons.powerOff,
            //       color: Colors.white,
            //     ),
            //     onPressed: () {
            //       //log out
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
 