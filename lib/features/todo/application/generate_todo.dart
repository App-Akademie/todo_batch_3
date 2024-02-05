import 'dart:math';

import 'package:todo_batch_3/features/todo/domain/todo.dart';

Todo generateTodo() {
  return Todo(
    id: "${Random().nextInt(1000)}",
    title: _getRandomString(10),
    description: _getRandomString(20),
    isDone: false,
  );
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String _getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
