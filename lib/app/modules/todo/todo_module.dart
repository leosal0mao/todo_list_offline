import 'package:flutter_modular/flutter_modular.dart';

import '../../core/external/database/database_adapter_impl.dart';
import 'domain/usecases/implementations/usecases_impl.dart';
import 'external/datasources/todo_local_datasource_impl.dart';
import 'infra/repositories/todo_repository_impl.dart';
import 'presenter/bloc/todo_bloc.dart';
import 'presenter/main_todo_view.dart';
import 'submodules/create_todo/create_todo_module.dart';
import 'submodules/edit_todo/edit_todo_module.dart';

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
        Bind((i) => TodoBloc(
            fetchUsecase: i.get(),
            createUsecase: i.get(),
            deleteUsecase: i.get(),
            updateUsecase: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const MainTodoView(title: 'Todo List')),
        ModuleRoute('/edit', module: EditTodoModule()),
        ModuleRoute('/create', module: CreateTodoModule()),
      ];
}
