import 'package:flutter/material.dart';
import 'package:todo_list_offline/app/modules/todo/domain/entities/entities.dart';

class TodoCardWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Todo todo;

  const TodoCardWidget({
    Key? key,
    required this.onPressed,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onPressed,
          child: SizedBox(
            height: _height / 8,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.check_box_outline_blank_rounded),
                  onPressed: () {},
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          todo.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          todo.description,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return Card(
    //   elevation: 5,
    //   child: ListTile(
    //     leading: FlutterLogo(size: 56.0),
    //     title: Text(todo.title),
    //     subtitle: Text(todo.description),
    //     trailing: IconButton(
    //       onPressed: onPressed,
    //       icon: const Icon(Icons.mode_edit_rounded),
    //     ),
    //   ),
    // );
  }
}
