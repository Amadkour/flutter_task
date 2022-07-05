import 'dart:convert';

import 'package:flutter_task/modules/profile/provider/model/details_model.dart';
import 'package:http/http.dart' as http;

import '../model/Person_model.dart';

class ProfileAPI {
  Future<List<DetailsModel>> getImages(id) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/person/$id/images?api_key=bc2e1c95566cd043dbc378ad350737ce'));
    return (jsonDecode(response.body))['profiles']
        .map((e) => DetailsModel.fromJson(e))
        .toList()
        .cast<DetailsModel>();
  }
}
