
import '../../../../core/database/sql.dart';
import '../../../profile/provider/model/Person_model.dart';
import '../network/home_api.dart';

class HomeRepo {
  getPopularList() async {
    SqlDb db = SqlDb();
    List<Map> response = await db.readData('home');
    if (response.isEmpty) {
      print('Loading from API');
      List<PersonModel> persons = await HomeAPI().getPopularList();
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

      return persons;
    } else {
      print('Loading from DB');
      return response
          .map((e) => PersonModel.fromJson(e))
          .toList()
          .cast<PersonModel>();
    }
  }
}
