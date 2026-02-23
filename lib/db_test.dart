import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'ahmed.db');
    Database myDb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onUpgrade: _onUpgrade,
    );
    return myDb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    print("updated DATABASE AND TABLE");
  }

  //
  _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE notes (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title TEXT NOT NULL,
    subTitle TEXT NOT NULL
  )
''');

    print('Create DATABASE AND TABLE');
  }

  //select
  getData(String sql) async {
    Database? myDb = await db;


    List<Map> response = await myDb!.rawQuery(sql);
    return response;
  }

  //update
  updateData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  //insert
  insterData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  //delete
  deleteData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(sql);
    return response;
  }
}
