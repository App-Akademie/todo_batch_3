import 'package:flutter/material.dart';
import 'package:todo_batch_3/features/todo/data/local_storage_repository.dart';
import 'package:todo_batch_3/features/todo/domain/todo.dart';

class TodoItem extends StatefulWidget {
  final LocalStorageRepository localStorageRepository;
  final Todo todo;
  const TodoItem(
      {super.key, required this.todo, required this.localStorageRepository});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  void initState() {
    super.initState();
    isDone = widget.todo.isDone;
  }

  late bool isDone;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(widget.todo.title, style: _getTodoTextStyle(isDone)),
          subtitle:
              Text(widget.todo.description, style: _getTodoTextStyle(isDone)),
          trailing: Checkbox(
            value: isDone,
            onChanged: (value) async {
              final newIsDone = value ?? false;
              await widget.localStorageRepository
                  .updateTodo(id: widget.todo.id, isDone: newIsDone);
              setState(() {
                isDone = newIsDone;
              });
            },
          )),
    );
  }

  TextStyle? _getTodoTextStyle(bool isDone) {
    if (isDone) {
      return const TextStyle(decoration: TextDecoration.lineThrough);
    }
    return null;
  }
}
