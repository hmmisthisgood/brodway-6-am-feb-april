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

  Database? _db;

  /// or can create a singleton with factory
  // factory DbService() {
  //   return _instance;
  // }

  static const _version = 1;
  static const _UsersTable = "users";
  final _createUsersTable = """
CREATE TABLE IF NOT EXISTS "$_UsersTable"(
id INTEGER PRIMARY KEY AUTOINCREMENT, 
firstName  VARCHAR(20),
lastName   VARCHAR(20),
createdAt   VARCHAR,
isAdmin   INT,
email     VARCHAR
);
""";

  final _createNotesTable = """
CREATE TABLE IF NOT EXISTS notes(
id  INTEGER PRIMARY KEY AUTOINCREMENT,
title  VARCHAR,
description TEXT,
createdAt VARCHAR,
updatedAt VARCHAR,
userId INTEGER
);
""";

  executeSqlWithTryCatch(String sql) {
    try {
      print("\n" + sql + "\n");
      _db?.execute(sql);
    } catch (e) {
      print(e.toString());
    }
  }

  init() async {
    /// C:\Users\
    /// /home/manish/Documents
    /// /data/users/0/com.exapmle.ticktok/

    print("Db serveive starting");
    final docsDirectory = await getApplicationDocumentsDirectory();

    final dbPath = join(docsDirectory.path, "database.db");
    _db = await openDatabase(
      dbPath,
      version: _version, //2
      onConfigure: (db) async {
        /// c =db.rawInsert(sql)
        /// r = db.rawQuery(sql)
        /// u= db.rawUpdate(sql)
        /// d=db.rawDelete(sql)

        /// create users table
        /// ""

        executeSqlWithTryCatch(_createUsersTable);
        // CRUD
      },
      onCreate: (db, version) {},
      onUpgrade: (db, newVer, oldVer) async {
        ///
        await executeSqlWithTryCatch(_createNotesTable);
      },
      onDowngrade: (db, newVer, oldVer) {
        ///
        print("on downgrade");
      },
    );
  }

  Future<List> getUsers() async {
    final res = await _db?.rawQuery('''SELECT * FROM users''');

    return res == null ? [] : res;
  }

  insertUser(Map<String, dynamic> user) async {
    try {
      final res = await _db?.insert(_UsersTable, user);

      print(res);
    } on DatabaseException catch (e) {
      print(e.isNotNullConstraintError());
    }
  }

  updateUser() async {
    final res = await _db?.rawUpdate('''SELECT * FROM users''');
    print(res);
  }

  deleteUser(int id) async {
    final res = await _db?.rawDelete('''DELETE  FROM users WHERE id=$id''');

    // final res = await _db.delete(_UsersTable, where: "id=?", whereArgs: [id]);
    print(res);
  }

  batch(List data) async {
    final batch = await _db?.batch();
    // batch?.insert(table, values); // X100000
    // batch?.delete(table)

    data.forEach((element) {
      batch?.insert("", element);
    });

    // Future.wait([]); // 5 *2 =2

    // Future.forEach(elements, (element) => null); // 10

    await batch?.commit();
  }
}
