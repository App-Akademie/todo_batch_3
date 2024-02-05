import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_batch_3/features/todo/domain/todo.dart';

const _todosKey = 'todos';

class SharedPrefsService {
  Future<void> setTodos(List<Todo> todos) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        _todosKey, todos.map((e) => jsonEncode(e.toJson())).toList());
  }

  Future<List<Todo>> getTodos() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(_todosKey);

    return jsonList?.map((e) => Todo.fromJson(jsonDecode(e))).toList() ?? [];
  }

  Future<void> addTodo(Todo todo) async {
    final todos = await getTodos();
    todos.add(todo);
    await setTodos(todos);
  }
}
