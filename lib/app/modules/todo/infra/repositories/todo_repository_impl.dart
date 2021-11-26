import 'package:dartz/dartz.dart';

import '../../../../core/helpers/errors/failure.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/todo_local_datasource.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDatasource datasource;

  TodoRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Todo>>> fetch() async {
    try {
      var response = await datasource.fetchTodos();
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Todo>> create() async {
    try {
      var response = await datasource.createTodo();
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Todo>> delete() async {
    try {
      var response = await datasource.deleteTodo();
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Todo>> update() async {
    try {
      var response = await datasource.updateTodo();
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
