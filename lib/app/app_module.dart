import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqlite_api.dart';

import 'package:todo_list_offline/app/modules/todo/todo_module.dart';

class AppModule extends Module {
  final Database database;

  AppModule(this.database);

  @override
  List<Bind> get binds => [
        Bind((i) => database),
      ];

  @override
  List<ModularRoute> get routes => [
        // ChildRoute('/', child: (context, args) => const SplashPage()),
        ModuleRoute('/', module: TodoModule()),
      ];
}
