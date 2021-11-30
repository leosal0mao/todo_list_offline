import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list_offline/app/core/external/database/database_adapter_impl.dart';
import 'package:todo_list_offline/app/modules/todo/domain/usecases/implementations/usecases_impl.dart';
import 'package:todo_list_offline/app/modules/todo/external/datasources/todo_local_datasource_impl.dart';
import 'package:todo_list_offline/app/modules/todo/presenter/main_todo_view.dart';

import 'infra/repositories/todo_repository_impl.dart';

class TodoModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => DatabaseAdapterImpl(database: i.get())),
        Bind((i) => TodoLocalDatasourceImpl(adapter: i.get())),
        Bind((i) => TodoRepositoryImpl(datasource: i.get())),
        Bind((i) => CreateTodoUsecaseImpl(repository: i.get())),
        Bind((i) => DeleteTodoUsecaseImpl(repository: i.get())),
        Bind((i) => FetchTodosUsecaseImpl(repository: i.get())),
        Bind((i) => UpdateTodoUsecaseImpl(repository: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const MainTodoView(title: 'title')),
      ];
}
