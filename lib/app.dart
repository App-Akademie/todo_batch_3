import 'package:flutter/material.dart';
import 'package:todo_batch_3/features/todo/data/local_storage_repository.dart';
import 'package:todo_batch_3/features/todo/data/shared_prefs/shared_prefs_repository.dart';
import 'package:todo_batch_3/features/todo/data/shared_prefs/shared_prefs_service.dart';
import 'package:todo_batch_3/features/todo/presentation/todo_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final service = SharedPrefsService();
    final LocalStorageRepository localStorageRepository =
        SharedPrefsRepository(service);

    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan,
        ),
      ),
      home: TodoScreen(
        localStorageRepository: localStorageRepository,
      ),
    );
  }
}
