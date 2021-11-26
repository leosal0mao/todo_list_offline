import 'package:dartz/dartz.dart';
import '../../../../../core/helpers/errors/failure.dart';
import '../../entities/entities.dart';

abstract class CreateTodoUsecase {
  Future<Either<Failure, int>> call(Todo todo);
}
