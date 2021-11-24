import 'package:dartz/dartz.dart';
import '../../../../core/helpers/errors/failure.dart';
import '../entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> fetchTodos();
}
