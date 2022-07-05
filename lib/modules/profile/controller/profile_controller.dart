import 'package:flutter/material.dart';

import '../provider/model/details_model.dart';
import '../provider/rep/profile_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final imagesController=FutureProvider<List<DetailsModel>>((ref) {
  return ProfileController().getImages(ref.watch(index).state);});
final index = StateProvider((ref) => '-1');

class ProfileController {
  Future<List<DetailsModel>>getImages(id)async{
    return await ProfileRepo().getImages(id);
  }
}


