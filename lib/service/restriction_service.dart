import 'dart:io';
import 'package:crimsy/model/restriction_model.dart';
import 'package:crimsy/service/urls.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

/*RESTRICTIONS*/

Future<List<Restriction>> getAllRestrictions() async {
  final response = await http.get(
      Uri.encodeFull('${URLS.BASE_URL}/restrictions'), 
      headers: {
        //"Accept": "application/json",
        "API-KEY": '${URLS.API_KEY}',
        HttpHeaders.contentTypeHeader: 'application/json',
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
    if (response.statusCode == 200) {
        var encodedResponse = Utf8Decoder().convert(response.bodyBytes);
        List jsonResponse = json.decode(encodedResponse);
        return jsonResponse.map((restriction) => new Restriction.fromJson(restriction)).toList(); 
      // return compute(parseResponse, response);
    } else {
      throw Exception('Failed to load restrictions');
    }
  }
      
  Future<Restriction> getRestriction(String id) async{
    final response = await http.get(
      Uri.encodeFull('${URLS.BASE_URL}/restrictions/$id'), 
      headers: {
        "API-KEY": '${URLS.API_KEY}',
        HttpHeaders.contentTypeHeader: 'application/json',
        "Content-Type": "application/x-www-form-urlencoded",
      }
    );
    if (response.statusCode == 200) {
      // var encodedResponse = Utf8Decoder().convert(response.bodyBytes);
      // List jsonResponse = json.decode(encodedResponse);
      return Restriction.fromJson(json.decode(response.body));
      // jsonResponse.map((restriction) => new Restriction.fromJson(restriction)).toList(); 
      // return compute(parseResponse, response);
  } else {
      throw Exception('Failed to load restriction');
    }
  }