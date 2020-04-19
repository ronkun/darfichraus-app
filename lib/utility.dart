import 'package:flutter/material.dart';
import 'dart:math' as Math;

class Utility {

  static String getAreaIdentifier(String areaIdentifierLong){
    return "";
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