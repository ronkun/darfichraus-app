import 'dart:io';
import 'package:crimsy/model/region_model.dart';
import 'package:crimsy/service/urls.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

  /* REGIONS */
  Future<List> getCitiesForZip(String zip) async{
    final response = await http.get(
      Uri.encodeFull('${URLS.BASE_URL}/geodata/by-zip-part/$zip'), 
      headers: {
        "API-KEY": '${URLS.API_KEY}',
        HttpHeaders.contentTypeHeader: 'application/json',
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
    if (response.statusCode == 200) {
        var encodedResponse = Utf8Decoder().convert(response.bodyBytes);
        final jsonResponse = json.decode(encodedResponse);
        // print(jsonResponse);
        Region region = Region.fromJson(jsonResponse);
        return region.regionCities;

    } else {
      return throw Exception('Failed to load regions');
    }
  }
