part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {}

class FetchTodosEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

class CreateTodoEvent extends TodoEvent {
  final Todo todo;

  CreateTodoEvent({required this.todo});
  @override
  List<Object?> get props => [todo];
}

class UpdateTodoEvent extends TodoEvent {
  final Todo todo;

  UpdateTodoEvent({required this.todo});

  @override
  List<Object?> get props => [todo];
}

class DeleteTodoEvent extends TodoEvent {
  final Todo todo;

  DeleteTodoEvent({required this.todo});
  @override
  List<Object?> get props => [todo];
}

enum CrudEnum {
  delete,
  create,
  update,
}

class CrudTodoEvent extends TodoEvent {
  final CrudEnum crudEnum;
  final Todo todo;

  CrudTodoEvent({
    required this.crudEnum,
    required this.todo,
  });

  @override
  List<Object?> get props => [crudEnum, todo];
}
