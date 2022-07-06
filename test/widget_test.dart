// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_task/core/repo/person_repo.dart';
import 'package:flutter_task/modules/home/controller/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake.dart';

void main() {
  final repositoryProvider = Provider((ref) => PersonRepo());

  testWidgets('override repositoryProvider ui/integration testing', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [repositoryProvider.overrideWithValue(FakeRepository())],
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(builder: (context, ref, _) {
              final persons = ref(homeControllerProvider);
              // The list of todos is loading or in error
             return persons.when(
                  data: (data) {
                    print(data.length);
                    return ListView(
                        children: [
                          for (final todo in data)
                            TodoItem(todo: todo)
                        ],
                      );},
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

    // expect(tester.widgetList(find.byType(TodoItem)),
    //     [isA<TodoItem>().having((s) => s.todo.id, 'check id', 42)].toList());
  });
}
