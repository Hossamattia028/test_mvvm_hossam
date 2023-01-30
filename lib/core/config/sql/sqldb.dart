

import 'package:flutter/material.dart';
import 'sql_table_names.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initSqlDb();
      return _db;
    } else {
      return _db;
    }
  }

  initSqlDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'data.db');
    Database myDb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return myDb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    debugPrint("onUpgrade ====================================");
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
  CREATE TABLE ${SqlTableName.simpleTable} (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT,
    "value" TEXT NOT NULL
  )
 ''');

    await batch.commit();
    debugPrint("onCreate ================================");
  }

  //SELECT Data
  readSqlData(String table) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.query(table);
    // log("dataFromLocal: $response");
    return response;
  }

  //INSERT Data
  insertSqlData(String table, Map<String, Object?> values) async {
    // log("values will be saved local: ${jsonEncode(values)}");
    Database? myDb = await db;
    int response = await myDb!.insert(table, values);
    return response;
  }

  //UPDATE data
  updateSqlData(String table, Map<String, Object?> values) async {
    Database? myDb = await db;
    int response = await myDb!.update(
      table,
      values,
    );

    return response;
  }

  //DELETE data
  deleteSqlData(String table) async {
    Database? myDb = await db;
    int response = await myDb!.delete(table);

    return response;
  }

  //Delete  all DataBase
  deleteAllDataBase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'data.db');
    await deleteDatabase(path);

    debugPrint("Deleted All DataBase ====================================");
  }
}
