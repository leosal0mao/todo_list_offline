import 'package:todo_list_offline/app/core/helpers/errors/failure.dart';

class CacheError extends Failure {
  CacheError(String message, StackTrace stackTrace)
      : super(message, stackTrace);
}
