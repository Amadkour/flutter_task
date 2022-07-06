
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_task/modules/home/provider/model/Person_model.dart';
import 'package:flutter_task/modules/profile/provider/model/details_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake.dart';

void main() {
  late FutureProvider fakeHomeControllerProvider;
  late FutureProvider  fakeProfileControllerProvider ;
  setUp(() {
    ///----------------home setup
    final repositoryProvider = Provider((ref) => FakeHomeRepository());
    //-------------------listen data--------------///
    fakeHomeControllerProvider = FutureProvider<List<PersonModel>>((ref) async {
      final repository = ref.read(repositoryProvider);
      return repository.fetchData(ref.read(StateProvider((ref) => 1)).state);

    });
  });
  group('Home Testing', () {
    testWidgets('Home Screen Testing ui/integration testing', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Consumer(builder: (context, ref, _) {
                final persons = ref(fakeHomeControllerProvider);
                // The list of todos is loading or in error
                return persons.when(
                    data: (data) {
                      return ListView(
                        children: [
                          for (final todo in data) HomeItem(todo: todo)
                        ],
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    error: (_, e) => Text(e.toString()));
              }),
            ),
          ),
        ),
      );

      // The first frame is a loading state.
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Re-render. TodoListProvider should have finished fetching the todos by now
      await tester.pump();

      // No longer loading
      expect(find.byType(CircularProgressIndicator), findsNothing);

      expect(tester.widgetList(find.byType(HomeItem)), [
        isA<HomeItem>()
            .having((s) => s.todo.id, 'check id', '42')
            .having((s) => s.todo.name, 'check name', 'i\'m fake')
      ]);
    });
  });

  ///----------------------------------profile testing
  setUp(() {
    ///------------------profile setup
    final repositoryProvider2 = Provider((ref) => FakeProfileRepository());
    ///-------------------listen data--------------///
    fakeProfileControllerProvider =
    FutureProvider<List<DetailsModel>>((ref) async {
      final repository = ref.read(repositoryProvider2);
      return repository
          .fetchData(ref.watch(StateProvider((ref) => '1')).state);
    });
  });
  group('Profile Testing', () {
    testWidgets('profile Screen Testing ui/integration testing',
        (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Consumer(builder: (context, ref, _) {
                final persons = ref(fakeProfileControllerProvider);
                // The list of todos is loading or in error
                return persons.when(
                    data: (data) {
                      return ListView(
                        children: [
                          for (final todo in data) ProfileItem(todo: todo)
                        ],
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    error: (_, e) => Text(e.toString()));
              }),
            ),
          ),
        ),
      );

      // The first frame is a loading state.
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Re-render. TodoListProvider should have finished fetching the todos by now
      await tester.pump();

      // // No longer loading
      expect(find.byType(CircularProgressIndicator), findsNothing);

      expect(tester.widgetList(find.byType(ProfileItem)), [
        isA<ProfileItem>()
            .having((s) => s.todo.height, 'check height', 500.0)
            .having((s) => s.todo.filePath,'check path', 'download/images')
      ]);
    });
  });
}
