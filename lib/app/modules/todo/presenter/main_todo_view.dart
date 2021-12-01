import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../domain/entities/entities.dart';
import 'bloc/todo_bloc.dart';

class MainTodoView extends StatefulWidget {
  const MainTodoView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainTodoView> createState() => _MyHomePageState();
}

class _MyHomePageState extends ModularState<MainTodoView, TodoBloc> {
  Future _incrementCounter() async {
    await controller.createUsecase(const Todo(
      tag: 1,
      title: 'title',
      description: 'description',
      // datetime: '12341231'
    ));
  }

  @override
  void initState() {
    super.initState();
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
              '1',
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
