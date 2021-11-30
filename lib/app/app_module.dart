import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo_list_offline/app/core/external/database/config/database_config.dart';

import 'package:todo_list_offline/app/modules/todo/todo_module.dart';

import 'modules/splash/presenter/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        AsyncBind<Database>((i) => DatabaseConfig.getInstance()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ModuleRoute('/todos', module: TodoModule()),
      ];
}
