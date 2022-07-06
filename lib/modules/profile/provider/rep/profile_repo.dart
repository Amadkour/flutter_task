
import '../../../../core/database/sql.dart';
import '../../../../core/repo/profile_repo.dart';
import '../model/Person_model.dart';
import '../model/details_model.dart';
import '../network/profile_api.dart';

class MyProfileRepo extends ProfileRepo {
  @override
  Future<List<DetailsModel>> fetchData(String personId)async{
    SqlDb db = SqlDb();
    List<Map> response = await db.readData('profile',id: personId);

    if (true==true) {
      List<DetailsModel> persons = await ProfileAPI().getImages(personId.toString());
      db.insertData(
          tableName: 'profile',
          data: persons
              .map((e) => {
                    'id': personId.toString(),
                    'height': e.height.toString(),
                    'width': e.width.toString(),
                    'image': e.filePath
                  })
              .toList());

      return persons;
    } else {
      return response
          .map((e) => DetailsModel.fromJson(e))
          .toList()
          .cast<DetailsModel>();
    }
  }
}
