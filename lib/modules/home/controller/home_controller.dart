import 'package:flutter_task/core/repo/person_repo.dart';

import '../../profile/provider/model/Person_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/rep/home_repo.dart';



///----------------repo provider---------------///
final repositoryProvider = Provider((ref) => HomeRepo());

///----------------page number provider---------------///
final pageNumber = StateProvider((ref) => 1);
///-------------------listen data--------------///
final homeControllerProvider = FutureProvider<List<PersonModel>>((ref) async {
  final repository = ref.read(repositoryProvider);
  return repository.fetchData( ref.watch(pageNumber).state);
});

