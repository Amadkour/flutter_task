import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  SqlDb() {
    initialDb();
  }

  static Database? _db;

  Future<Database> get db async {
    _db = await initialDb();
    return _db!;
  }

  initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'popular.db');

    Database mydb = await openDatabase(path, version: 3, onCreate: _onCreate);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    ///To make tablies
    await db.execute('''
    CREATE TABLE "home" (
    'name' TEXT NOT NULL,
    'id' TEXT NOT NULL,
    'known_for_department' TEXT NOT NULL,
    'profile_path' TEXT NOT NULL
     )''');

    await db.execute('''
    CREATE TABLE "profile" (
    'id' TEXT NOT NULL,
    'height' TEXT NOT NULL,
    'width' TEXT NOT NULL,
    'file_path' TEXT NOT NULL
     )''');
  }

  ///Example to get reade data ( await db.readData('tableName') )
  readData(String tableName, {id,limit}) async {
    Database mydb = await db;
    print(
        "-----------------------( Database ReadData )--------------------->DB($tableName)");
    List<Map>? response;
    try {
      response =
          await mydb.query(tableName, where: id == null ? null : 'id = $id',limit:limit );
    } catch (e) {
      print(e);
    }
    return response;
  }

  ///Example to set reade data (  await db.insertData( 'INSERT INTO tableName(key1, key2) VALUES(value1, value2)')
  insertData({required String tableName, required List<dynamic> data}) async {
    Database mydb = await db;
    for (Map element in data) {
      await mydb.rawInsert(
          "INSERT INTO $tableName VALUES(\"${element.values.join('","')}\")");
    }
    mydb.close();
  }

  insertDataByValues(String sql, dynamic values) async {
    Database mydb = await db;
    int response = await mydb.insert(
      sql,
      values,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return response;
  }

  updateData(String sql, List list) async {
    Database mydb = await db;
    int response = await mydb.rawUpdate(sql, list);
    return response;
  }

  ///Example to get delete data ( await db.delete('tableName') )
  deleteData(String tableName) async {
    Database mydb = await db;
    int response = await mydb.delete(tableName);
    return response;
  }
}
