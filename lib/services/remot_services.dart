import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.dart';

class RemoteServices {
  static var client = http.Client();

  static const accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiIyMC44My4zMi43M1wvdGVzdF9xdWl6IiwiYXVkIjoiVEhFX0FVRElFTkNFIiwiaWF0IjoxNjc4MTAwNDcwLCJkYXRhIjp7ImlkIjoiMzg0IiwiZW1haWwiOiJwZEBnbWFpbC5jb20ifX0.mT_ciRtBRwpCDprGJ4eHBF9PMA0G0fdE6DVTz7cWVsU";

  static String category= '';

  static void printResponse(
      Map<String, String> header, dynamic body, http.Response response) {
    print('Header: $header');
    print('Body : $body');
    print('URL: ${response.request!.url}');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  static Future<http.Response> categoryNews(category) async {
    Map<String, String> header = {
      //'Authorization': 'Bearer $accessToken'
    };

    http.Response response = await http.get(
        Uri.parse(Apis.baseAPI + category + Apis.newsCategoryAPI),
        headers: header);
    printResponse(header, null, response);
    return response;
  }


  static Future<http.Response> getNews() async {
    Map<String, String> header = {
      //'Authorization': 'Bearer $accessToken'
    };

    http.Response response = await http.get(
        Uri.parse(Apis.newsAPI),
        headers: header);
    printResponse(header, null, response);
    return response;
  }

  static Future<http.Response> getBookList() async {
    Map<String, String> header = {
      //'Authorization': 'Bearer $accessToken'
    };

    http.Response response = await http.get(
        Uri.parse(Apis.bookApi),
        headers: header);
    printResponse(header, null, response);
    return response;
  }



}
