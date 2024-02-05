import 'package:flutter/material.dart';
import 'package:todo_batch_3/features/todo/application/generate_todo.dart';
import 'package:todo_batch_3/features/todo/data/local_storage_repository.dart';
import 'package:todo_batch_3/features/todo/domain/todo.dart';
import 'package:todo_batch_3/features/todo/presentation/todo_item.dart';

class TodoScreen extends StatefulWidget {
  final LocalStorageRepository localStorageRepository;
  const TodoScreen({super.key, required this.localStorageRepository});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
    todosFuture = widget.localStorageRepository.readTodos();
  }

  late Future<List<Todo>> todosFuture;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('B3 Todo List'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // add random todo
            await widget.localStorageRepository.addTodo(
              generateTodo(),
            );

            setState(() {
              // reload todos
              todosFuture = widget.localStorageRepository.readTodos();
            });
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: todosFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState != ConnectionState.waiting) {
                final todos = snapshot.data!;
                // Daten fertig geladen, Future entpackt

                if (todos.isEmpty) {
                  return const Center(
                    child: Text('Noch keine Todos'),
                  );
                }
                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return TodoItem(
                      localStorageRepository: widget.localStorageRepository,
                      todo: todo,
                    );
                  },
                );
              } else {
                // else -> Daten nicht fertig geladen
                // nicht fertig geladen -> entweder Ladend oder Error
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
