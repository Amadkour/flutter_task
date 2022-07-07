import 'dart:convert';

import 'package:flutter_task/core/constant/strings.dart';
import 'package:http/http.dart' as http;

import '../model/Person_model.dart';

class HomeAPI {
  Future<List<PersonModel>> getPopularList(int pageNumber) async {
    try {
      http.Response response = await http.get(Uri.parse(
          '${AppStrings
              .basUrl}popular?api_key=bc2e1c95566cd043dbc378ad350737ce&language=en-US&page=$pageNumber'));
      if(response.statusCode==200) {
        return (jsonDecode(response.body))['results']
          .map((e) => PersonModel.fromJson(e))
          .toList()
          .cast<PersonModel>();
      }else{
        return [];
      }
    }catch(_){
      return [];
    }
  }
}
