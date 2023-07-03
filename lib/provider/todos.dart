import 'package:flutter/cupertino.dart';

import '../model.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: ' نوت ١',
      description: '''- نوت  
- 
''',
      check: true,
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'نوت ٢',
      description: '''- نوت 
''',
      check: true,
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'نوت ٣',
      check: true,
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}
