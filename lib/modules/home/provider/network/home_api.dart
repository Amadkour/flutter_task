import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../profile/provider/model/Person_model.dart';


class HomeAPI {
  Future<List<PersonModel>> getPopularList() async {
    http.Response response = await http.get(Uri.parse('https://api.themoviedb.org/3/person/popular?api_key=bc2e1c95566cd043dbc378ad350737ce&language=en-US&page=1'));
    return (jsonDecode(response.body))['results']
        .map((e) => PersonModel.fromJson(e))
        .toList()
        .cast<PersonModel>();
  }
}
