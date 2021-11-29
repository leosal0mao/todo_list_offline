import 'package:dartz/dartz.dart';
import 'package:todo_list_offline/app/modules/todo/external/mappers/mappers.dart';

import '../../../../core/helpers/errors/failure.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/todo_local_datasource.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDatasource datasource;

  TodoRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<Todo>>> fetch() async {
    try {
      var response = await datasource.fetch();
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, int>> create(Todo todo) async {
    try {
      var response = await datasource.create(map: TodoMapper.toMap(todo));
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, int>> delete(Todo todo) async {
    try {
      var response = await datasource.delete(todo.id);
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, int>> update(Todo todo) async {
    try {
      var response = await datasource.update(TodoMapper.toMap(todo));
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
