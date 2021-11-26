import '../../domain/entities/entities.dart';

abstract class TodoLocalDatasource {
  Future<List<Todo>> fetchTodos();

  Future<Todo> createTodo();

  Future<Todo> updateTodo();

  Future<Todo> deleteTodo();
}
