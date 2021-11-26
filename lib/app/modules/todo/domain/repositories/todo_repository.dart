import 'package:dartz/dartz.dart';
import '../../../../core/helpers/errors/failure.dart';
import '../entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> fetch();

  Future<Either<Failure, int>> create(Todo todo);

  Future<Either<Failure, int>> delete(Todo todo);

  Future<Either<Failure, int>> update(Todo todo);
}
