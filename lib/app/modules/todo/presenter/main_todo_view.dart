import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list_offline/app/modules/todo/domain/entities/entities.dart';
import 'package:todo_list_offline/app/modules/todo/domain/usecases/implementations/usecases_impl.dart';
import 'package:todo_list_offline/app/modules/todo/domain/usecases/interfaces/usecases.dart';

class MainTodoView extends StatefulWidget {
  const MainTodoView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainTodoView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainTodoView> {
  int _counter = 0;
  late DeleteTodoUsecase controller;

  Future _incrementCounter() async {
    await controller.call(const Todo(
        id: 1,
        tag: 1,
        title: 'title',
        description: 'description',
        datetime: '12341231'));
  }

  @override
  void initState() {
    super.initState();
    controller = Modular.get<DeleteTodoUsecaseImpl>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
