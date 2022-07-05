import 'package:flutter/material.dart';

import '../../profile/provider/model/Person_model.dart';
import '../provider/rep/home_repo.dart';

class HomeController extends ChangeNotifier{
  HomeController(){
    getData();
  }
  List<PersonModel> persons=[];
  getData()async{
    try {
      persons = await HomeRepo().getPopularList();
      notifyListeners();

    }catch(e){
      print(e);
    }
  }
}
