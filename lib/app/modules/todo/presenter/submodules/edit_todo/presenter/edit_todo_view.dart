import 'package:flutter/material.dart';
import 'package:todo_list_offline/app/modules/todo/domain/entities/entities.dart';

class EditTodoView extends StatelessWidget {
  final Todo? todo;
  const EditTodoView({Key? key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text(todo!.title),
      ),
    );
  }
}
