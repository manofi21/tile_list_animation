import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/random_user_model.dart';

abstract class RandomPeopleRemoteDataSource {
  Future<List<ResultRandomPeople>> getListRandomUserApi();
}

class RandomPeopleRemoteDataSourceImpl implements RandomPeopleRemoteDataSource {
  @override
  Future<List<ResultRandomPeople>> getListRandomUserApi() async {
    try {
      final url = Uri.https('randomuser.me', '/api', {'results': '50', 'inc': 'name,picture'});
      final response = await http.get(url);
      final result =  RandmomPeople.fromJson(jsonDecode(response.body));
      return result.results;      
    } catch (e) {
      throw Exception(e);
    }
  }
} 