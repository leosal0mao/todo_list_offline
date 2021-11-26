import 'package:dartz/dartz.dart';

import '../../../../../core/helpers/errors/failure.dart';
import '../../entities/todo.dart';
import '../../repositories/repositories.dart';
import '../interfaces/usecases.dart';

class UpdateTodoUsecaseImpl extends UpdateTodoUsecase {
  final TodoRepository repository;

  UpdateTodoUsecaseImpl({required this.repository});

  @override
  Future<Either<Failure, int>> call(Todo todo) {
    return repository.update(todo);
  }
}
