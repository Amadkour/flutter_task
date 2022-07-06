import '../../../../core/database/sql.dart';
import '../../../profile/provider/model/Person_model.dart';
import '../network/home_api.dart';

class HomeRepo {
  int databaseSize = 0;

  getPopularList(int pageNumber) async {
    print('hiiiii------------------');
    SqlDb db = SqlDb();
    List<Map> response = await db.readData('home', limit: 20 * pageNumber);
    if (response.isEmpty || response.length < (pageNumber - 1) * 20) {
      print('Loading from API');
      List<PersonModel> persons = await HomeAPI().getPopularList(pageNumber);

      db.insertData(
          tableName: 'home',
          data: persons
              .map((e) => {
                    'name': e.name,
                    'id': e.id.toString(),
                    'type': e.knownForDepartment,
                    'image': e.profilePath
                  })
              .toList());

      return response
          .map((e) => PersonModel.fromJson(e))
          .toList()
          .cast<PersonModel>().addAll(persons);
    } else {
      print('Loading from DB');
      return response
          .map((e) => PersonModel.fromJson(e))
          .toList()
          .cast<PersonModel>();
    }
  }
}
