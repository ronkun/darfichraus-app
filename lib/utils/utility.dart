import 'package:flutter/material.dart';
import 'dart:math' as Math;

import 'package:intl/intl.dart';

class Utility {

   static Image translateRestrictionAreaSymbol(String area) {
    switch (area) {
      case "Rheinland-Pfalz":
        return Image(image: AssetImage('assets/state_img/rheinlandpfalz.png'), fit: BoxFit.fitWidth);
      // return Image.asset('assets/state_img/rheinlandpfalz.png');
      case "Baden-Württemberg":
        return Image(image: AssetImage('assets/state_img/badenwuertemberg.png'), fit: BoxFit.fitWidth);
      case "Hessen":
        return Image(image: AssetImage('assets/state_img/hessen.png'), fit: BoxFit.fitWidth);
      case "Hamburg":
        return Image(image: AssetImage('assets/state_img/hamburg.png'), fit: BoxFit.fitWidth);
      case "Sachsen-Anhalt": 
        return Image(image: AssetImage('assets/state_img/sachsenanhalt.png'), fit: BoxFit.fitWidth);
      case "Nordrhein-Westfalen":
        return Image(image: AssetImage('assets/state_img/nordrheinwestfalen.png'), fit: BoxFit.fitWidth);
      case "Berlin":  
        return Image(image: AssetImage('assets/state_img/berlin.png'), fit: BoxFit.fitWidth);
      case "Hamburg":
          return Image(image: AssetImage('assets/state_img/hamburg.png'), fit: BoxFit.fitWidth);
      case "Bayern":  
        return Image(image: AssetImage('assets/state_img/bayern.png'), fit: BoxFit.fitWidth);
      case "Bremen":  
        return Image(image: AssetImage('assets/state_img/bremen.png'), fit: BoxFit.fitWidth); 
      case "Saarland":  
        return Image(image: AssetImage('assets/state_img/saarland.png'), fit: BoxFit.fitWidth);
      case "Sachsen":  
        return Image(image: AssetImage('assets/state_img/sachsen.png'), fit: BoxFit.fitWidth);      
      case "Schleswig-Holstein":  
        return Image(image: AssetImage('assets/state_img/schleswigholstein.png'), fit: BoxFit.fitWidth);
      case "Thüringen":  
        return Image(image: AssetImage('assets/state_img/thueringen.png'), fit: BoxFit.fitWidth);
      case "Brandenburg":  
        return Image(image: AssetImage('assets/state_img/brandenburg.png'), fit: BoxFit.fitWidth);
      case "Berlin":  
        return Image(image: AssetImage('assets/state_img/berlin.png'), fit: BoxFit.fitWidth);
      case "Mecklenburg-Vorpommern":  
        return Image(image: AssetImage('assets/state_img/mecklenburgvorpommern.png'), fit: BoxFit.fitWidth);
      default:
        return null;
    }
  }

  static formatDateTime(String dateTime) {
    final dateFormatter = DateFormat('dd.MM.yyyy');
    return dateFormatter.format(DateTime.now());
  }

  static String getAreaIdentifier(String areaIdentifierLong){
    return "";
  }

  static getIconForCategory(String cat){
    switch (cat) {
      case "EVENTS_AND_ASSEMBLIES": 
        return Icons.people;
      case "CURFEW":
        return Icons.not_interested;
      case "PUBLIC_PLACES":  
        return Icons.location_city;
      case "GASTRONOMY":
        return Icons.restaurant;
      case "RETAIL":  
        return Icons.shopping_cart;   
      case "PUBLIC_TRANSPORTATION":  
        return Icons.directions_bus;   
      default:
        return Icons.question_answer;
    }
  }

  static void showAlert(BuildContext context, String text) {
    var alert = new AlertDialog(
      content: Container(
        child: Row(
          children: <Widget>[Text(text)],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );

    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }
 
  static bool compare(double v1, double v2, [int fractionDigits]) {
    if (v1 == v2) return true;
    if (fractionDigits != null && v1 != null && v2 != null) {
      return v1.toStringAsFixed(fractionDigits) == v2.toStringAsFixed(fractionDigits);
    }
    return false;
  }

  static bool compareDuration(Duration v1, Duration v2, [int fractionInMilliseconds]) {
    if (v1 == v2) return true;
    if (fractionInMilliseconds != null && v1 != null && v2 != null) {
      return v1.inMilliseconds / fractionInMilliseconds == v2.inMilliseconds / fractionInMilliseconds;
    }
    return false;
  }

  final Math.Random _random = new Math.Random();
  Color generateRandomColor() => Color(0xFF000000 + _random.nextInt(0x00FFFFFF));

  static Widget getCircularProgressIndicator(double width, double height) {
    return Center(child: SizedBox(
      child: CircularProgressIndicator(),
      height: height,
      width: width,
    ));
  }
}

class ConverterUtil {
  static String dateTimeToString(DateTime t) => t.toUtc().toIso8601String();
  static DateTime stringToDateTime(String s) => DateTime.parse(s).toUtc();
  static String durationToString(Duration d) => d?.inMicroseconds?.toString();
  static Duration stringToDuration(String s) => Duration(microseconds: int.parse(s));
}

class StringUtil {
  static bool equalIgnoreCase(String s1, String s2) => (s1?.toLowerCase() == s2?.toLowerCase());
  static bool isNullOrEmpty(String s) => s == null || s.isEmpty;
  static bool notNullOrEmpty(String s) => !isNullOrEmpty(s);
}