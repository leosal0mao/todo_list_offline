import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import '../../../helpers/errors/cache_error.dart';

class DatabaseConfig {
  DatabaseConfig._internal();

  static Future<Database> getInstance() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, "test.db");
      return openDatabase(
        path,
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE Todo(id INTEGER PRIMARY KEY AUTOINCREMENT, '
            'title TEXT, tag INTEGER, description TEXT)',
          );
        },
        version: 2,
      );
    } catch (e, stack) {
      throw CacheError(e.toString(), stack);
    }
  }
}
