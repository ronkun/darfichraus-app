import 'dart:io';
import 'package:crimsy/model/reference_model.dart';
import 'package:crimsy/model/restriction_model.dart';
import 'package:flutter/foundation.dart';
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
        headers: {//"Accept": "application/json",
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
      throw Exception('Failed to load restrictions');
    }
    // return postFromJson(response.body);
  }

  /*SITUATIONs*/

  Future<Post> getAllSituations() async{
    final response = await http.get(
        Uri.encodeFull('${URLS.BASE_URL}/situation-advisor/situations'), 
        headers: {
          //"Accept": "application/json",
          "API-KEY": '${URLS.API_KEY}'
        }
      );
    return postFromJson(response.body);
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

  /*SUBSCRIPTION*/

  Future<http.Response> createSubscription(String title, String email, String zip, String arealIdentifier) {
    return http.post(
      '${URLS.BASE_URL}/subscriptions',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        // "modified": "2020-05-11T20:30:27.115Z",
        "email": email,
        "areal": zip,
        "arealIdentifier": arealIdentifier,
        "types": "GENERAL_INFORMATION"
      }),
    );
  }

      // Future<http.Response> createRestriction(Post post) async{
      //   final response = await http.post(
      //       Uri.encodeFull('${URLS.BASE_URL}/restrictions'), 
      //       headers: {//"Accept": "application/json",
      //       "API-KEY": '${URLS.API_KEY}',
      //         HttpHeaders.contentTypeHeader: 'application/json',
      //         HttpHeaders.authorizationHeader : ''
      //       },
      //       body: postToJson(post)
      //   );
      //   return response;
      // }
      
      //Future<Post> createPost(Post post) async{
      //  final response = await http.post('$url',
      //      headers: {
      //        HttpHeaders.contentTypeHeader: 'application/json'
      //      },
      //      body: postToJson(post)
      //  );
      //
      //  return postFromJson(response.body);
      //}

      // List<Restriction> parseResponse(dynamic response) {
        //compute function for response?
      // }