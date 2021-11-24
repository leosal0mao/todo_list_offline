import '../../../../../core/helpers/errors/failure.dart';

class TodoMapperErrors extends Failure {
  TodoMapperErrors(String message, StackTrace stackTrace)
      : super(message, stackTrace);
}
