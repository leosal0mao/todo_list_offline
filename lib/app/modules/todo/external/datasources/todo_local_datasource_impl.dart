import 'package:sqflite/sqflite.dart';
import 'package:todo_list_offline/app/core/helpers/errors/core_errors.dart';

import '../../../../core/external/database/database_adapter.dart';
import '../../domain/entities/todo.dart';

import '../../infra/datasources/todo_local_datasource.dart';

class TodoLocalDatasourceImpl implements TodoLocalDatasource {
  final DatabaseAdapter adapter;

  TodoLocalDatasourceImpl({required this.adapter});

  @override
  Future<Todo> createTodo() async {
    try {
      return;
    } on Failure {
      rethrow;
    } on DatabaseException catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    } catch (e, stack) {
      throw DatasourceError(e.toString(), stack);
    }
  }

  @override
  Future<Todo> deleteTodo() async {
    try {
      return;
    } on Failure {
      rethrow;
    } on DatabaseException catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    } catch (e, stack) {
      throw DatasourceError(e.toString(), stack);
    }
  }

  @override
  Future<List<Todo>> fetchTodos() async {
    try {
      return;
    } on Failure {
      rethrow;
    } on DatabaseException catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    } catch (e, stack) {
      throw DatasourceError(e.toString(), stack);
    }
  }

  @override
  Future<Todo> updateTodo() async {
    try {
      return;
    } on Failure {
      rethrow;
    } on DatabaseException catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    } catch (e, stack) {
      throw DatasourceError(e.toString(), stack);
    }
  }
}
