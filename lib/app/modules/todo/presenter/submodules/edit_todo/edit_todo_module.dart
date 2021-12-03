import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list_offline/app/modules/todo/presenter/submodules/edit_todo/presenter/edit_todo_view.dart';

class EditTodoModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => EditTodoView(todo: args.data)),
      ];
}
