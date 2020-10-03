import 'dart:convert';
import 'package:the_cat_api/models/user.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  // http://jsonplaceholder.typicode.com/users

  // ignore: missing_return
  Future<List<Url>> getUser() async {
    final response = await http.get(
//      'https://catfact.ninja/facts',
      'https://api.thecatapi.com/v1/images/search?limit=10&mime_types=jpg,png#',
    );

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => Url.fromJson(json)).toList();
    } else {
      print(response.statusCode.toString());
    }
  }
}
