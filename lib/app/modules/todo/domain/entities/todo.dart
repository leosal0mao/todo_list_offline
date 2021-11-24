import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final int id;
  final int tag;
  final String title;
  final String description;
  final String datetime;

  const Todo({
    required this.id,
    required this.tag,
    required this.title,
    required this.description,
    required this.datetime,
  });

  @override
  List<Object?> get props => [id, tag, title, description, datetime];
}
