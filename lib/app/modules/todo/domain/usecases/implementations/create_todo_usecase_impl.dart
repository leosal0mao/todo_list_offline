import 'package:dartz/dartz.dart';

import '../../../../../core/helpers/errors/failure.dart';
import '../../entities/todo.dart';
import '../../repositories/repositories.dart';
import '../interfaces/usecases.dart';

class CreateTodoUsecaseImpl extends CreateTodoUsecase {
  final TodoRepository repository;

  CreateTodoUsecaseImpl({required this.repository});

  @override
  Future<Either<Failure, int>> call(Todo todo) {
    return repository.create(todo);
  }
}
