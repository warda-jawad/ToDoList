import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../model.dart';
import '../provider/todos.dart';
import '../screen/edit_todo_page.dart';
import '../utils.dart';

class TodoWidget extends StatefulWidget {
  final Todo todo;

  const TodoWidget({
    required this.todo,
    Key? key,
  }) : super(key: key);

  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  _showMyDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(
                widget.todo.title,
                style: const TextStyle(fontFamily: "Cairo", fontSize: 25),
              ),
              content: const Text('هل تريد حقا حذف المهمة ؟',
                  style: TextStyle(
                    fontFamily: "Cairo",
                  )),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: const Text(
                    "لا ",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    deleteTodo(context, widget.todo);
                    Navigator.of(context).pop();
                  },
                  child: const Text("نعم", style: TextStyle(color: Colors.red)),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 100.0,
        height: 80.0,
        child: Scaffold(
          body: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Slidable(
              key: ValueKey(widget.todo.id),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {
                  setState(() {
                    deleteTodo(context, widget.todo);
                  });
                }),
                children: [
                  SlidableAction(
                    onPressed: (BuildContext) {},
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'delete',
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (BuildContext) =>
                        deleteTodo(context, widget.todo),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'delete',
                  ),
                  SlidableAction(
                    onPressed: (BuildContext) => editTodo(context, widget.todo),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'edit',
                  ),
                ],
              ),
              child: buildTodo(context),
            ),
          ),
        ),
      );

  Widget buildTodo(BuildContext context) => GestureDetector(
        onTap: () => editTodo(context, widget.todo),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  _showMyDialog();
                },
                child: const Image(
                  image: AssetImage("assets/images/deleted.png"),
                  width: 40,
                  height: 40,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        widget.todo.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  final provider =
                      Provider.of<TodosProvider>(context, listen: false);
                  final isDone = provider.toggleTodoStatus(widget.todo);

                  Utils.showSnackBar(
                    context,
                    isDone ? 'تم انهاء المهمة' : 'لم يتم انهاء المهمة',
                  );
                },
                child: const Image(
                  image: AssetImage("assets/images/true.png"),
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);
    Utils.showSnackBar(context, 'تم حذف المهمة');
  }

  void editTodo(BuildContext context, Todo todo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditTodoPage(todo: todo),
      ),
    );
  }
}
