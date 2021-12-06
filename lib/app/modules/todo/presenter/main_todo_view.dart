import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rive/rive.dart';
import 'package:todo_list_offline/app/core/presenter/widgets/bottom_loader_widget.dart';
import 'package:todo_list_offline/app/modules/todo/presenter/widgets/custom_appbar_widget.dart';
import '../domain/entities/entities.dart';
import 'bloc/todo_bloc.dart';
import 'widgets/todo_card_widget.dart';

class MainTodoView extends StatefulWidget {
  const MainTodoView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainTodoView> createState() => _MyHomePageState();
}

class _MyHomePageState extends ModularState<MainTodoView, TodoBloc> {
  @override
  void initState() {
    super.initState();
    controller.add(FetchTodosEvent());
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppbarWidget(),
      // AppBar(
      //   title: Text(widget.title),
      // ),
      body: BlocBuilder<TodoBloc, TodoState>(
        bloc: controller,
        builder: (context, state) {
          switch (state.runtimeType) {
            case TodoLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case TodoFailureState:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    height: _height / 1.50,
                    child: const RiveAnimation.asset(
                      'assets/animations/alert.riv',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(child: Text('Failed to gather information')),
                ],
              );
            case TodoSucessState:
              return ListView.builder(
                  // controller: _scrollController,
                  itemCount: 20,
                  padding: const EdgeInsets.all(10.0),
                  itemBuilder: (context, i) {
                    var _todo = Todo(
                        tag: 1, title: 'title', description: 'description');
                    return i + 1 >= 21
                        ? const BottomLoaderWidget()
                        : Dismissible(
                            background: Container(
                              decoration: BoxDecoration(color: Colors.red),
                            ),
                            confirmDismiss: (direction) async {
                              return true;
                            },
                            key: Key(_todo.id.toString()),
                            child: TodoCardWidget(
                                todo: _todo,
                                onPressed: () {
                                  Modular.to
                                      .pushNamed('./edit/', arguments: _todo);
                                }),
                          );
                  });
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        onPressed: () {},
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
