import 'package:flutter_modular/flutter_modular.dart';
import 'presenter/create_todo_view.dart';

class CreateTodoModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const CreateTodoView()),
      ];
}
