import 'package:dartz/dartz.dart';
import '../../repositories/repositories.dart';

import '../../../../../core/helpers/errors/failure.dart';
import '../../entities/todo.dart';
import '../interfaces/fetch_todos_usecase.dart';

class FetchTodosUsecaseImpl extends FetchTodosUsecase {
  final TodoRepository repository;

  FetchTodosUsecaseImpl({required this.repository});

  @override
  Future<Either<Failure, List<Todo>>> call() {
    return repository.fetchTodos();
  }
}
