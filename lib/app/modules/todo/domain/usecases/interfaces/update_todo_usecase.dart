import 'package:dartz/dartz.dart';
import '../../../../../core/helpers/errors/core_errors.dart';
import '../../entities/entities.dart';

abstract class UpdateTodoUsecase {
  Future<Either<Failure, int>> call(Todo todo);
}
