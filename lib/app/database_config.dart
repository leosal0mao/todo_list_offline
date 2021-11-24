import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseConfig {
  DatabaseConfig._internal();

  late Database? _database;
  static late DatabaseConfig _instance = DatabaseConfig._internal();

  Future<Database> get database async => _database ??= await _onInit();

  factory DatabaseConfig() {
    return _instance;
  }

  Future<Database> _onInit() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      version: 1,
    );
  }
}
