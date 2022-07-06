import 'dart:convert';

import 'package:flutter_task/core/constant/strings.dart';
import 'package:flutter_task/modules/profile/provider/model/details_model.dart';
import 'package:http/http.dart' as http;

class ProfileAPI {
  Future<List<DetailsModel>> getImages(String id) async {
    http.Response response = await http.get(Uri.parse(
        '${AppStrings.basUrl}$id/images?api_key=bc2e1c95566cd043dbc378ad350737ce'));
    return (jsonDecode(response.body))['profiles']
        .map((e) => DetailsModel.fromJson(e))
        .toList()
        .cast<DetailsModel>();
  }
}
