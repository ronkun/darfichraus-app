import 'dart:io';
import 'package:crimsy/model/reference_model.dart';
import 'package:crimsy/model/region_model.dart';
import 'package:crimsy/model/restriction_model.dart';
import 'package:crimsy/model/situation_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:crimsy/model/post_model.dart';
import 'dart:convert';


/*URL*/

class URLS {
//  static const String BASE_URL = 'https://api.darfichraus.de';
 static const String BASE_URL = 'https://api.dev.crimsy.tech';
 static const String API_KEY = '6bce1751a010f90b68eb887cae8e2141cce149d5de664412e67cdf150006aa16f2bd0373ce496aa5';
}

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

  /*SITUATIONs*/

  Future<List<Situation>> getAllSituations() async{
    final response = await http.get(
      Uri.encodeFull('${URLS.BASE_URL}/situation-advisor/situations'), 
      headers: {
        "API-KEY": '${URLS.API_KEY}',
        HttpHeaders.contentTypeHeader: 'application/json',
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
    if (response.statusCode == 200) {
        var encodedResponse = Utf8Decoder().convert(response.bodyBytes);
        List jsonResponse = json.decode(encodedResponse);
        return jsonResponse.map((situation) => new Situation.fromJson(situation)).toList(); 
    } else {
      throw Exception('Failed to load situations');
    }
  }

  Future<Situation> getSituation(String id) async{
    final response = await http.get(
      Uri.encodeFull('${URLS.BASE_URL}/situations/$id'), 
      headers: {
        "API-KEY": '${URLS.API_KEY}',
        HttpHeaders.contentTypeHeader: 'application/json',
        "Content-Type": "application/x-www-form-urlencoded",
      }
    );
    if (response.statusCode == 200) {
        return Situation.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load situation');
    }
  }

  /*SITUATION REFERENCES*/
  
  Future<Post> getSituationReference(int id) async{
    final response = await http.get(
        Uri.encodeFull('${URLS.BASE_URL}/situation-advisor/situation-references/$id'), 
        headers: {
          //"Accept": "application/json",
          "API-KEY": '${URLS.API_KEY}'
        }
      );
    return postFromJson(response.body);
  }
  
  Future<List<SituationReference>> getAllSituationReferences() async {
    final response = await http.get(
        Uri.encodeFull('${URLS.BASE_URL}/situation-advisor/situation-references'), 
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
        return jsonResponse.map((reference) => new SituationReference.fromJson(reference)).toList();
      } else {
        throw Exception('Failed to load situation references');
      }
  }

  /* REGIONS */
  Future<List<Region>> getRegionsForZip(String zip) async{
    final response = await http.get(
      Uri.encodeFull('${URLS.BASE_URL}/geodata/by-zip-part/$zip'), 
      headers: {
        "API-KEY": '${URLS.API_KEY}',
        HttpHeaders.contentTypeHeader: 'application/json',
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
    print(response.bodyBytes);
    if (response.statusCode == 200) {
        var encodedResponse = Utf8Decoder().convert(response.bodyBytes);
        List jsonResponse = json.decode(encodedResponse);
        // print(jsonResponse);
        return jsonResponse.map((region) => new Region.fromJson(region)).toList(); 
    } else {
      throw Exception('Failed to load regions');
    }
  }

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