import 'package:flutter/material.dart';
import 'dart:math' as Math;

import 'package:flutter_svg/flutter_svg.dart';

class Utility {

static const List<String> assetNames = <String>[
  // 'assets/notfound.svg', // uncomment to test an asset that doesn't exist.
  'assets/state_img/hessen.svg',
];

  static String getAreaIdentifier(String areaIdentifierLong){
    return "";
  }

  static getIconForCategory(String cat){
    switch (cat) {
      case "EVENTS_AND_ASSEMBLIES": 
        return Icons.directions_bus;
      case "CURFEW":
        return Icons.close;
      case "PUBLIC_PLACES":  
        return Icons.place;
      case "GASTRONOMY":
        return Icons.fastfood;
      case "RETAIL":  
        return Icons.shopping_basket;   
      default:
        return Icons.alarm;
    }
  }

    static getIconForState(String state){
    switch (state) {
      case "Rheinland-Pfalz":
        print("rheinlandpfalz");
        return Image(image: AssetImage('assets/state_img/rheinlandpfalz.png'), fit: BoxFit.fitWidth);
      // case "Baden-Württemberg":
      //    return new SvgPicture.asset(
      //     assetNames[0], 
      //     height: 10.0,
      //     width: 10.0,
      //     allowDrawingOutsideViewBox: true,
      //   );
      // case "Hessen":
      //         print("hessen");
      //        return new SvgPicture.asset(
      //     assetNames[0], 
      //     height: 10.0,
      //     width: 10.0,
      //     allowDrawingOutsideViewBox: true,
      //   );
      // case "Hamburg":
      //            return new SvgPicture.asset(
      //     assetNames[0], 
      //     height: 10.0,
      //     width: 10.0,
      //     allowDrawingOutsideViewBox: true,
      //   );
      // case "Sachsen-Anhalt": 
      //            return new SvgPicture.asset(
      //     assetNames[0], 
      //     height: 10.0,
      //     width: 10.0,
      //     allowDrawingOutsideViewBox: true,
      //   );
      // case "Nordrhein-Westfalen":
      //   return Image(image: AssetImage('assets/nordrheinwestfalen.svg'));
      // case "Berlin":  
      //   return Image(image: AssetImage('assets/berlin.svg'));
      // case "Hamburg":
      //   return Image(image: AssetImage('assets/hamburg.svg'));
      // case "Rheinland-Pflaz":  
      //   return Image(image: AssetImage('assets/rheinlandpfalz.svg')); 
      default:
        return Image(image: AssetImage('assets/state_img/rheinlandpfalz.png'), fit: BoxFit.fitWidth);
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
  /// converter (to/from String)
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