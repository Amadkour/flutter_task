import '../../../../core/database/sql.dart';
import '../../../../core/repo/person_repo.dart';
import '../../../profile/provider/model/Person_model.dart';
import '../network/home_api.dart';

class HomeRepo extends PersonRepo {
  @override
  Future<List<PersonModel>> fetchData(int pageNumber) async {
    SqlDb db = SqlDb();
    List<Map> response = await db.readData('home', limit: 20 * pageNumber);
    if (response.isEmpty || response.length < (pageNumber - 1) * 20) {
      List<PersonModel> persons = await HomeAPI().getPopularList(pageNumber);

      db.insertData(
          tableName: 'home',
          data: persons
              .map((e) =>
          {
            'name': e.name,
            'id': e.id.toString(),
            'type': e.knownForDepartment,
            'image': e.profilePath
          })
              .toList());

      return (await db.readData('home')).map((e) => PersonModel.fromJson(e))
          .toList()
          .cast<PersonModel>();
    } else {
      return response
          .map((e) => PersonModel.fromJson(e))
          .toList()
          .cast<PersonModel>();
    }
  }
}