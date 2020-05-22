
import 'package:crimsy/service/urls.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

  /*SUBSCRIPTION*/

  Future<http.Response> createSubscription(String title, String email, String zip, String arealIdentifier) {
    return http.post(
      '${URLS.BASE_URL}/subscriptions',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "areal": zip,
        "arealIdentifier": arealIdentifier,
        "types": "GENERAL_INFORMATION"
      }),
    );
  }