import 'package:flutter/material.dart';

import '../../../core/repo/profile_repo.dart';
import '../provider/model/details_model.dart';
import '../provider/rep/profile_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///----------------repo provider---------------///
final repositoryProvider = Provider((ref) => MyProfileRepo());
///----------------person Id provider---------------///
final personId = StateProvider((ref) => '1');
///-------------------listen data--------------///
final profileControllerProvider = FutureProvider<List<DetailsModel>>((ref) async {
  final repository = ref.read(repositoryProvider);
  return repository.fetchData( ref.watch(personId).state);
});