
import '../../../../core/database/sql.dart';
import '../model/Person_model.dart';
import '../model/details_model.dart';
import '../network/profile_api.dart';

class ProfileRepo {
  Future<List<DetailsModel>> getImages(id) async {
    SqlDb db = SqlDb();
    List<Map> response = await db.readData('profile',id: id);
    if (response.isEmpty) {
      print('Loading from API');
      List<DetailsModel> persons = await ProfileAPI().getImages(id);
      db.insertData(
          tableName: 'profile',
          data: persons
              .map((e) => {
                    'id': id.toString(),
                    'height': e.height.toString(),
                    'width': e.width.toString(),
                    'image': e.filePath
                  })
              .toList());

      return persons;
    } else {
      print('Loading from DB');
      return response
          .map((e) => DetailsModel.fromJson(e))
          .toList()
          .cast<DetailsModel>();
    }
  }
}
