import 'package:flutter/material.dart';

import '../../profile/provider/model/Person_model.dart';
import '../provider/rep/home_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final homeControllerProvider = FutureProvider<List<PersonModel>>((ref) async {
  return HomeController().getData( ref.watch(pageNumber).state);
});
final pageNumber = StateProvider((ref) => 1);

final listController = StateProvider((ref) => ScrollController());

class HomeController{

  Future<List<PersonModel>> getData(int pageNumber)async{
    List<PersonModel> persons=[];
    try {
      persons = await HomeRepo().getPopularList(pageNumber);
    }catch(e){
      print(e);
    }
    return persons;
  }
}
