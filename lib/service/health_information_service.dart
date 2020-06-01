import 'dart:convert';
import 'package:crimsy/model/city_information_model.dart';
import 'package:crimsy/model/health_information_model.dart';
import 'package:crimsy/service/urls.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';

HealthInformationHelper healthInformationServiceFromJson(String str) => HealthInformationHelper.fromJson(json.decode(str));
String healthInformationServiceToJson(HealthInformationHelper data) => json.encode(data.toJson());

class HealthInformationHelper {
    CityInformation location;
    List<HealthInformation> healthInformation;

    HealthInformationHelper({
        this.location,
        this.healthInformation,
    });

    factory HealthInformationHelper.fromJson(Map<String, dynamic> json) => HealthInformationHelper(
        location: CityInformation.fromJson(json["location"]),
        healthInformation: List<HealthInformation>.from(json["healthInformation"].map((x) => HealthInformation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "healthInformation": List<dynamic>.from(healthInformation.map((x) => x.toJson())),
    };
}

// Future<List<HealthInformationHelper>> getAllHealthInfosByZip(String zip) async {
Future<HealthInformationHelper> getAllHealthInfosByZip(String zip) async {
  final response = await http.get(
      Uri.encodeFull('${URLS.BASE_URL}/health-information/by-zip/$zip'), 
      headers: {
        //"Accept": "application/json",
        "API-KEY": '${URLS.API_KEY}',
        HttpHeaders.contentTypeHeader: 'application/json',
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );

    if (response.statusCode == 200) {
        var encodedResponse = Utf8Decoder().convert(response.bodyBytes);
        var jsonResponse = json.decode(encodedResponse);
        // print("HealthInfos: "+jsonResponse.toString());
        HealthInformationHelper helper = new HealthInformationHelper.fromJson(jsonResponse);
        // HealthInformation healthInfo = helper.healthInformation.first;
        // print("Death: "+healthInfo.deaths.toString());
        return helper;
        // return jsonResponse.map((healthInfo) => new HealthInformationHelper.fromJson(healthInfo)).toList();
      // return compute(parseResponse, response);
    } else {
      throw Exception('Failed to load restrictions');
    }
  }

  // Future<Restriction> getRestriction(String id) async{
  //   final response = await http.get(
  //     Uri.encodeFull('${URLS.BASE_URL}/restrictions/$id'), 
  //     headers: {
  //       "API-KEY": '${URLS.API_KEY}',
  //       HttpHeaders.contentTypeHeader: 'application/json',
  //       "Content-Type": "application/x-www-form-urlencoded",
  //     }
  //   );
  //   if (response.statusCode == 200) {
  //     // var encodedResponse = Utf8Decoder().convert(response.bodyBytes);
  //     // List jsonResponse = json.decode(encodedResponse);
  //     return Restriction.fromJson(json.decode(response.body));
  //     // jsonResponse.map((restriction) => new Restriction.fromJson(restriction)).toList(); 
  //     // return compute(parseResponse, response);
  // } else {
  //     throw Exception('Failed to load restriction');
  //   }
  // }