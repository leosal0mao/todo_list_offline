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
          datetime: map['datetime']);
    } catch (e, stack) {
      throw TodoMapperErrors(e.toString(), stack);
    }
  }

  Map<String, dynamic> toMap(Todo todo) {
    try {
      return {
        'id': todo.id,
        'tag': todo.tag,
        'title': todo.title,
        'description': todo.description,
        'datetime': todo.datetime,
      };
    } catch (e, stack) {
      throw TodoMapperErrors(e.toString(), stack);
    }
  }
}
