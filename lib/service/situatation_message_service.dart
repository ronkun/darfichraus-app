import 'dart:io';
import 'package:crimsy/model/post_model.dart';
import 'package:crimsy/model/reference_model.dart';
import 'package:crimsy/model/situation_model.dart';
import 'package:crimsy/service/urls.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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