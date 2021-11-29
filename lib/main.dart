import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list_offline/app/app_widget.dart';
import 'package:todo_list_offline/app/core/external/database/config/database_config.dart';
import 'package:path/path.dart';
import 'app/app_module.dart';

Future<void> main() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, "test.db");
  // String documentsDirectory = await getDatabasesPath();
  // String path = join(documentsDirectory, "todos.db");
  var database = await openDatabase(
    path,
    onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE Todo(id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'title TEXT, tag INTEGER, date_time TEXT, description TEXT)',
      );
    },
    version: 2,
  );

  runApp(
    ModularApp(
      module: AppModule(database),
      child: const AppWidget(),
    ),
  );
}
