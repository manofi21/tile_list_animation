import 'dart:convert';

import 'package:http/http.dart' as http;
import 'random_user.dart';

Future<List<ResultRandomPeople>> getListRandom() async {
  var url = Uri.https('randomuser.me', '/api', {'results': '50', 'inc': 'name,picture'});
  var response = await http.get(url);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final result =  RandmomPeople.fromJson(jsonDecode(response.body));
    return result.results;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}