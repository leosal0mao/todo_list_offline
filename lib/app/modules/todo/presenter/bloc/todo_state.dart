part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {}

class TodoInitialState extends TodoState {
  @override
  List<Object?> get props => [];
}

class TodoLoadingState extends TodoState {
  @override
  List<Object?> get props => [];
}

class TodoFailureState extends TodoState {
  final String message;

  TodoFailureState({required this.message});
  @override
  List<Object?> get props => [message];
}

class TodoSucessState extends TodoState {
  final bool isLoading;
  final Todo? todo;
  final List<Todo>? todoList;

  TodoSucessState({
    this.isLoading = false,
    this.todo,
    this.todoList,
  });

  TodoSucessState copyWith(
    Todo? todo,
    List<Todo>? todoList,
    bool? isLoading,
  ) {
    return TodoSucessState(
        todo: todo ?? this.todo,
        todoList: todoList ?? this.todoList,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [isLoading, todoList, todo];
}
