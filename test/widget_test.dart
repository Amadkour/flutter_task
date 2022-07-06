// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_task/modules/profile/provider/model/Person_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  group('getNumberTrivia', () {
    test('returns number trivia string when http response is successful',
            () async {

          // Mock the API call to return a json response with http status 200 Ok //
          final mockHTTPClient = MockClient((request) async {

            // Create sample response of the HTTP call //
            final response = {
            "text":
            "22834 is the feet above sea level of the highest mountain in the Western Hemisphere, Mount Aconcagua in Argentina.",
            "number": 22834,
            "found": true,
            "type": "trivia"
            };
            return Response(jsonEncode(response), 200);
          });
          // Check whether getNumberTrivia function returns
          // number trivia which will be a String
          expect(await getApi(mockHTTPClient), isA<String>());
        });

    test('return error message when http response is unsuccessful', () async {

      // Mock the API call to return an
      // empty json response with http status 404
      final mockHTTPClient = MockClient((request) async {
        final response = {};
        return Response(jsonEncode(response), 200);
      });
      expect((await getApi(mockHTTPClient)).length,
         20);
    });
  });
}
final moviesRepositoryProvider = Provider((ref) => MoviesRepository());

final moviesProvider = FutureProvider<List<PersonModel>>((ref) {
  // access the provider above
  final repository = ref.watch(moviesRepositoryProvider);
  // use it to return a Future
  return repository.favouriteMovies();
});
class MoviesRepository {
  Future<List<PersonModel>> favouriteMovies() async {
    // get data from the network or local database
    return [];
  }
}

class MockMoviesRepository implements MoviesRepository {
  @override
  Future<List<PersonModel>> favouriteMovies() {
    return Future.value([
      PersonModel(id: 1, name: 'Rick & Morty', profilePath: 'https://nnbd.me/1.png'),
      PersonModel(id: 2, name: 'Seinfeld', profilePath: 'https://nnbd.me/2.png'),
    ]);
  }
}
Future<Map> getApi(http.Client http) async {
  Uri numberAPIURL = Uri.parse('https://api.themoviedb.org/3/person/popular?api_key=bc2e1c95566cd043dbc378ad350737ce&language=en-US&page=1');
  final response = await http.get(numberAPIURL);
  if (response.statusCode == 200) {
    final Map triviaJSON = jsonDecode(response.body);
    return triviaJSON['results'];
  } else {
    return {'error':'true'};
  }
}