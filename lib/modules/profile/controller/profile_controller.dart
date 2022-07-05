import 'package:flutter/material.dart';

import '../provider/model/details_model.dart';
import '../provider/rep/profile_repo.dart';

class ProfileController extends ChangeNotifier{
  bool isLoading=false;
  List<DetailsModel> images=[];
  getImages(id)async{
    // isLoading=true;
    await Future.delayed(Duration(seconds: 4));
    try {
      images = await ProfileRepo().getImages(id);
      isLoading=false;
    }catch(e){
      print(e);
    }
    notifyListeners();

  }
}
