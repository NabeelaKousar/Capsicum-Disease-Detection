import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final tableUser = 'users';
  static final tableDoctor = 'doctors';

  static final columnId = '_id';
  static final columnFirstName = 'firstName';
  static final columnLastName = 'lastName';
  static final columnEmail = 'email';
  static final columnPassword = 'password';
  static final columnRole = 'role';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // open the database
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableUser (
      uid INTEGER PRIMARY KEY AUTOINCREMENT,
      role TEXT NOT NULL,
      firstName TEXT NOT NULL,
      lastName TEXT NOT NULL,
      email TEXT NOT NULL,
      password TEXT NOT NULL,
      phone TEXT,
      address TEXT
    )
    ''');
    await db.execute('''
    CREATE TABLE $tableDoctor (
      uid INTEGER PRIMARY KEY AUTOINCREMENT,
      role TEXT NOT NULL,
      firstName TEXT NOT NULL,
      lastName TEXT NOT NULL,
      email TEXT NOT NULL,
      password TEXT NOT NULL,
      phone TEXT,
      address TEXT 
    )
    ''');
  }

  // Helper methods

  Future<int> insert(Map<String, dynamic> row, String table) async {
    Database db = await instance.database;
    int result = await db.insert(table, row);
    debugPrint('Inserted $result into $table');
    return result;
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> results = await db.query(table);
    debugPrint(
        'Queried all rows from $table. Number of rows: ${results.length}');
    return results;
  }

  Future<int?> queryRowCount(String table) async {
    Database db = await instance.database;
    int? count =
        Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
    debugPrint('Counted rows in $table. Total: $count');
    return count;
  }

  Future<int> update(Map<String, dynamic> row, String table) async {
    Database db = await instance.database;
    int id = row[columnId];
    int result =
        await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
    debugPrint(
        'Updated row with id $id in $table. Number of rows affected: $result');
    return result;
  }

  Future<int> delete(int id, String table) async {
    Database db = await instance.database;
    int result =
        await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
    debugPrint(
        'Deleted row with id $id from $table. Number of rows affected: $result');
    return result;
  }

  // Login Methods

  Future<bool> login(String email, String password) async {
    Database db = await instance.database;
    var res = await db.rawQuery(
        "SELECT * FROM $tableUser WHERE $columnEmail = '$email' and $columnPassword = '$password'");

    return res.isNotEmpty;
  }
}
