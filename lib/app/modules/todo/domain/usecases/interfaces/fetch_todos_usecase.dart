import 'package:dartz/dartz.dart';
import '../../../../../core/helpers/errors/failure.dart';
import '../../entities/todo.dart';

abstract class FetchTodosUsecase {
  Future<Either<Failure, List<Todo>>> fetch();

  Future<Either<Failure, Todo>> create();

  Future<Either<Failure, Todo>> delete();

  Future<Either<Failure, Todo>> update();
}
