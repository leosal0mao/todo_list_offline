import 'package:todo_list_offline/app/core/helpers/errors/failure.dart';

class DatasourceError extends Failure {
  DatasourceError(String message, StackTrace stackTrace)
      : super(message, stackTrace);
}
