import '../../domain/entities/entities.dart';

abstract class TodoLocalDatasource {
  Future<List<Todo>> fetch();

  Future<int> create({required Map<String, dynamic> map});

  Future<int> update(Map<String, dynamic> map);

  Future<int> delete(int id);
}
