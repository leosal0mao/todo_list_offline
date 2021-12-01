import '../../domain/entities/entities.dart';
import '../helpers/errors/errors.dart';

class TodoMapper {
  TodoMapper._();

  static Todo fromMap(Map<String, dynamic> map) {
    try {
      return Todo(
        id: map['id'],
        tag: map['tag'],
        title: map['title'],
        description: map['description'],
        // datetime: map['datetime']
      );
    } catch (e, stack) {
      throw TodoMapperErrors(e.toString(), stack);
    }
  }

  static Map<String, dynamic> toMap(Todo todo) {
    try {
      return {
        if (todo.id != null) 'id': todo.id,
        'tag': todo.tag,
        'title': todo.title,
        'description': todo.description,
        // 'datetime': todo.datetime,
      };
    } catch (e, stack) {
      throw TodoMapperErrors(e.toString(), stack);
    }
  }

  static List<Todo> fromListMap(List<Map<String, dynamic>> maps) {
    try {
      return maps.map((e) => fromMap(e)).toList();
    } catch (e, stack) {
      throw TodoMapperErrors(e.toString(), stack);
    }
  }
}
