import 'package:dartz/dartz.dart';
import '../../repositories/repositories.dart';

import '../../../../../core/helpers/errors/failure.dart';
import '../../entities/todo.dart';
import '../interfaces/fetch_todos_usecase.dart';

class FetchTodosUsecaseImpl extends FetchTodosUsecase {
  final TodoRepository repository;

  FetchTodosUsecaseImpl({required this.repository});

  @override
  Future<Either<Failure, List<Todo>>> fetch() {
    return repository.fetch();
  }

  @override
  Future<Either<Failure, Todo>> create() {
    return repository.create();
  }

  @override
  Future<Either<Failure, Todo>> delete() {
    return repository.delete();
  }

  @override
  Future<Either<Failure, Todo>> update() {
    return repository.update();
  }
}
