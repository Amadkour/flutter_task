import 'package:flutter/cupertino.dart';
import 'package:flutter_task/core/repo/person_repo.dart';
import 'package:flutter_task/core/repo/profile_repo.dart';
import 'package:flutter_task/modules/home/provider/model/Person_model.dart';
import 'package:flutter_task/modules/profile/provider/model/details_model.dart';
///-----------------Home

class FakeHomeRepository extends PersonRepo  {
  @override
  Future<List<PersonModel>> fetchData(int pageNumber) async{
    return [
      PersonModel(id: 42, name: 'i\'m fake'),
    ];
  }
}
class HomeItem extends StatelessWidget {
  const HomeItem({Key? key, required this.todo}) : super(key: key);
  final PersonModel todo;
  @override
  Widget build(BuildContext context) {
    return Text(todo.name!);
  }
}
///-----------------profile
class FakeProfileRepository extends ProfileRepo  {
  @override
  Future<List<DetailsModel>> fetchData(String pageNumber) async{
    return [
      DetailsModel(height: 500, filePath: 'download/images',width: 500),
    ];
  }
}
class ProfileItem extends StatelessWidget {
  const ProfileItem({Key? key, required this.todo}) : super(key: key);
  final DetailsModel todo;
  @override
  Widget build(BuildContext context) {
    return Text(todo.filePath!);
  }
}

