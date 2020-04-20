import 'dart:io';

import 'package:crimsy/model/restriction_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:crimsy/model/post_model.dart';
import 'dart:convert';

//String url = 'https://api.darfichraus.de';

class URLS {
 static const String BASE_URL = 'https://api.darfichraus.de';
 static const String API_KEY = '6bce1751a010f90b68eb887cae8e2141cce149d5de664412e67cdf150006aa16f2bd0373ce496aa5';
}

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
    var encodedResponse = Utf8Decoder().convert(response.bodyBytes);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(encodedResponse);
      return jsonResponse.map((restriction) => new Restriction.fromJson(restriction)).toList();
    } else {
      throw Exception('Failed to load restrictions from API');
    }
}

Future<Post> getRestriction(int id) async{
  final response = await http.get(
      Uri.encodeFull('${URLS.BASE_URL}/restrictions/$id'), 
      headers: {//"Accept": "application/json",
      "API-KEY": '${URLS.API_KEY}'});
  return postFromJson(response.body);
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