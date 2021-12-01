import 'package:sqflite/sqlite_api.dart';
import 'database_adapter.dart';
import '../../helpers/errors/core_errors.dart';

class DatabaseAdapterImpl implements DatabaseAdapter {
  final Database database;

  DatabaseAdapterImpl({required this.database});

  @override
  Future<int> delete(String table, String where, List args) {
    try {
      return database.delete(table, where: where, whereArgs: args);
    } on DatabaseException catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    } catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    }
  }

  @override
  Future<int> insert(String table, Map<String, dynamic> object) {
    try {
      return database.insert(table, object);
    } on DatabaseException catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    } catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    }
  }

  @override
  Future<int> update(
      String table, Map<String, dynamic> object, String where, List args) {
    try {
      return database.update(
        table,
        object,
        where: where,
        whereArgs: args,
      );
    } on DatabaseException catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    } catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    }
  }

  @override
  Future<List<Map<String, Object?>>> querySql(String sql, List? args) {
    try {
      return database.rawQuery(sql, args);
    } on DatabaseException catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    } catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    }
  }

  @override
  Future<List<Map<String, Object?>>> query(String table,
      {bool? distinct,
      List<String>? columns,
      String? where,
      List<Object?>? args,
      String? groupBy,
      String? having,
      String? orderBy,
      int? limit,
      int? offset}) {
    try {
      return database.query(
        table,
        distinct: distinct,
        columns: columns,
        where: where,
        whereArgs: args,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        limit: limit,
        offset: offset,
      );
    } on DatabaseException catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    } catch (e, stack) {
      throw DatabaseError(e.toString(), stack);
    }
  }
}
