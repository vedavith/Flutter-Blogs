import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BaseController {
  var api = 'http://localhost:4000';

  ///  doPost
  Future<dynamic> doPost(String handle, Map<String,dynamic> body) async {
    final response = await http.post(Uri.parse(api + handle),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(body));

    // Handle Response
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return jsonEncode({'error': 'Post Failed', 'statusCode': response.statusCode});
    }
  }

// Future<http.Response> doGet(handle)
// {

// }

// Future<http.Response> doPut()
// {

// }

// Future<http.Response> doDelete()
// {

// }

}