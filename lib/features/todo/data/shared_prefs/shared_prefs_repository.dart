import 'package:todo_batch_3/features/todo/data/local_storage_repository.dart';
import 'package:todo_batch_3/features/todo/data/shared_prefs/shared_prefs_service.dart';
import 'package:todo_batch_3/features/todo/domain/todo.dart';

class SharedPrefsRepository implements LocalStorageRepository {
  final SharedPrefsService _sharedPrefsService;

  SharedPrefsRepository(this._sharedPrefsService);

  @override
  Future<List<Todo>> readTodos() {
    return _sharedPrefsService.getTodos();
  }

  @override
  Future<void> writeTodos(List<Todo> todos) {
    return _sharedPrefsService.setTodos(todos);
  }

  @override
  Future<void> addTodo(Todo todo) {
    return _sharedPrefsService.addTodo(todo);
  }

  @override
  Future<void> updateTodo({required String id, required bool isDone}) async {
    final tempTodos = await _sharedPrefsService.getTodos();
    final index = tempTodos.indexWhere((element) => element.id == id);
    tempTodos[index] = Todo(
      id: tempTodos[index].id,
      isDone: isDone,
      title: tempTodos[index].title,
      description: tempTodos[index].description,
    );
    return _sharedPrefsService.setTodos(tempTodos);
  }
}
