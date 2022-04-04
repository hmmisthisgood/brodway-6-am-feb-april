import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbService {
  DbService.private() {
    ///
  }

  static final _instance = DbService.private();

  static DbService get instance => _instance;
  late Database _db;

  // factory DbService() {
  //   return _instance;
  // }
  static const _version = 1;
  static const _UsersTable = "users";
  final _createUsersTable = """
CREATE TABLE "$_UsersTable"(
id INTEGER PRIMARY KEY AUTOINCREMENT,
firstName  VARCHAR(20),
lastName   VARCHAR(20),
createdAt   VARCHAR,
isAdmin   INT,
email     VARCHAR
);
""";

  init() async {
    /// C:\Users\
    /// /home/manish/Documents
    /// /data/users/0/com.exapmle.ticktok/

    print("Db serveive starting");
    final docsDirectory = await getApplicationDocumentsDirectory();

    final dbPath = join(docsDirectory.path, "database.db");
    _db = await openDatabase(
      dbPath,
      version: _version,
      onConfigure: (db) async {
        /// c =db.rawInsert(sql)
        /// r = db.rawQuery(sql)
        /// u= db.rawUpdate(sql)
        /// d=db.rawDelete(sql)

        /// create users table
        /// ""

        try {
          await db.execute(_createUsersTable);
        } on DatabaseException catch (e) {
          print(e.toString());
          print(e.isSyntaxError());
        }
      },
      onCreate: (db, version) {},
      onUpgrade: (db, newVer, oldVer) {},
      onDowngrade: (db, newVer, oldVer) {},
    );
  }

  Future<List> getUsers() async {
    final res = await _db.rawQuery('''SELECT * FROM users''');
    return res;
  }

  insertUser(Map<String, dynamic> user) async {
    try {
      final res = await _db.insert(_UsersTable, user);
      print(res);
    } on DatabaseException catch (e) {
      print(e.isNotNullConstraintError());
    }
  }

  updateUser() async {
    final res = await _db.rawQuery('''SELECT * FROM users''');
    print(res);
  }

  deleteUser(int id) async {
    final res = await _db.rawQuery('''DELETE  FROM users WHERE id=$id''');
    // final res = await _db.delete(_UsersTable, where: "id=?", whereArgs: [id]);
    print(res);
  }
}
