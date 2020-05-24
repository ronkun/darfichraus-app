import 'package:crimsy/model/city_information_model.dart';
import 'package:crimsy/widgets/advisor/objects/colorChoice.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AdvisorCardObject {
  String uuid;
  int sortID;
  String title;
  Color color;
  LinearGradient gradient;
  IconData icon;
  CityInformation region;
  List<Image> crisisRestrictionsIcons;

  AdvisorCardObject(String title, IconData icon, CityInformation region) {
    this.title = title;
    this.icon = icon;
    // ColorChoice choice = ColorChoices.choices[Random().nextInt(ColorChoices.choices.length)];
    ColorChoice choice = ColorChoices.choices[2];
    this.color = choice.primary;
    this.gradient = LinearGradient(colors: choice.gradient, begin: Alignment.bottomCenter, end: Alignment.topCenter);
    this.uuid = Uuid().v1();
    this.crisisRestrictionsIcons = crisisRestrictionsIcons; 
    this.region = region;
    // print("UUID AdvObj: "+uuid);
  }

  // AdvisorCardObject.import(String uuidS, String title, int sortID, ColorChoice color, IconData icon) {
  //   this.sortID = sortID;
  //   this.title = title;
  //   this.color = color.primary;
  //   this.gradient = LinearGradient(colors: color.gradient, begin: Alignment.bottomCenter, end: Alignment.topCenter);
  //   this.icon = icon;
  //   this.uuid = uuidS;
  // }
}