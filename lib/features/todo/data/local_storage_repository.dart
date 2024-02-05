import 'package:todo_batch_3/features/todo/domain/todo.dart';

abstract class LocalStorageRepository {
  Future<void> writeTodos(List<Todo> todos);
  Future<List<Todo>> readTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo({
    required String id,
    required bool isDone,
  });
}
