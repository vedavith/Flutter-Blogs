import 'package:http/http.dart' as http;
import 'dart:convert';

class Basecontroller {
  var api = 'http://localhost:8000/api/';

  Future<bool> doPost(String handle, body) async {
    var response = await http.post(Uri.parse(api + handle),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(body));

    print(response.statusCode);
    print(response.body);

    return true;

    //return jsonDecode(response.body);
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
