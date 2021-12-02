import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rive/rive.dart';
import 'package:todo_list_offline/app/core/presenter/widgets/bottom_loader_widget.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        bloc: controller,
        builder: (context, state) {
          switch (state.runtimeType) {
            case TodoLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case TodoFailureState:
              return Center(
                  child: Column(
                children: [
                  RiveAnimation.asset(
                    'assets/animations/alert.riv',
                    fit: BoxFit.fill,
                  ),
                  const Center(child: Text('Failed to gather information')),
                ],
              ));
            case TodoSucessState:
              return ListView.builder(
                  // controller: _scrollController,
                  itemCount: 5,
                  padding: const EdgeInsets.all(10.0),
                  itemBuilder: (context, i) {
                    return i + 1 >= 6
                        ? const BottomLoaderWidget()
                        : TodoCardWidget(
                            todo: Todo(
                                tag: 1,
                                title: 'title',
                                description: 'description'),
                            onPressed: () {
                              Modular.to.pushNamed('/details/', arguments: i);
                            });
                  });
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
