import 'package:todo_list_offline/app/core/helpers/errors/failure.dart';

class DatabaseError extends Failure {
  DatabaseError(String message, StackTrace stackTrace)
      : super(message, stackTrace);
}
