import 'package:flutter/cupertino.dart';
import 'package:flutter_task/core/repo/person_repo.dart';
import 'package:flutter_task/modules/profile/provider/model/Person_model.dart';

class FakeRepository extends PersonRepo  {
  @override
  Future<List<PersonModel>> fetchData(int pageNumber) async{
    return [
      PersonModel(id: 42, name: 'i\'m fake'),

    ];
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key, required this.todo}) : super(key: key);
  final PersonModel todo;
  @override
  Widget build(BuildContext context) {
    return Text(todo.name!);
  }
}
