import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/widget/todo_widget.dart';

import '../provider/todos.dart';

class CompletedListWidget extends StatefulWidget {
  @override
  _CompletedListWidgetState createState() => _CompletedListWidgetState();
}

class _CompletedListWidgetState extends State<CompletedListWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;

    return Scaffold(
      body: todos.isEmpty
          ? const Center(
              child: Text(
                'لا يوجد مهام مكتملة',
                style: TextStyle(fontSize: 20, fontFamily: "Cairo"),
              ),
            )
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              separatorBuilder: (context, index) => Container(height: 8),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];

                return TodoWidget(todo: todo);
              },
            ),
    );
  }
}
