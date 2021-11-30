import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/todo/presenter/main_todo_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainTodoView(title: 'Flutter Demo Home Page'),
    ).modular();
  }
}
