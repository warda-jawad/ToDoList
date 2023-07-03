import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/widget/todo_widget.dart';

import '../provider/todos.dart';

class TodoListWidget extends StatefulWidget {
  @override
  _TodoListWidgetState createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);

    final todos = provider.todos;

    return Scaffold(
      body: todos.isEmpty
          ? const Center(
              child: Text(
                'لا يوجد مهام ',
                style: TextStyle(fontSize: 20, fontFamily: "Cairo"),
              ),
            )
          : SizedBox(
              width: 900,
              height: 900,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                separatorBuilder: (context, index) => Container(height: 8),
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];

                  return TodoWidget(todo: todo);
                },
              ),
            ),
    );
  }
}
