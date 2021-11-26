import 'package:sqflite/sqflite.dart';
import 'package:todo_list_offline/app/modules/todo/external/mappers/mappers.dart';

import '../../../../core/external/database/database_adapter.dart';
import '../../../../core/helpers/errors/core_errors.dart';
import '../../domain/entities/todo.dart';
import '../../infra/datasources/todo_local_datasource.dart';

class TodoLocalDatasourceImpl implements TodoLocalDatasource {
  final DatabaseAdapter adapter;

  TodoLocalDatasourceImpl({required this.adapter});

  @override
  Future<int> create({required Map<String, dynamic> map}) {
    try {
      return adapter.insert('Todo', map);
    } on Failure {
      rethrow;
    } on DatabaseException catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    } catch (e, stack) {
      throw DatasourceError(e.toString(), stack);
    }
  }

  @override
  Future<int> delete(int id) {
    try {
      return adapter.delete('Todo', 'id = ?', [id]);
    } on Failure {
      rethrow;
    } on DatabaseException catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    } catch (e, stack) {
      throw DatasourceError(e.toString(), stack);
    }
  }

  @override
  Future<int> update(Map<String, dynamic> map) {
    try {
      return adapter.update('Todo', map, 'id = ?', [map['id']]);
    } on Failure {
      rethrow;
    } on DatabaseException catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    } catch (e, stack) {
      throw DatasourceError(e.toString(), stack);
    }
  }

  @override
  Future<List<Todo>> fetch() async {
    try {
      final response = await adapter.query('Todo');
      return TodoMapper.fromListMap(response);
    } on Failure {
      rethrow;
    } on DatabaseException catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    } catch (e, stack) {
      throw DatasourceError(e.toString(), stack);
    }
  }
}
