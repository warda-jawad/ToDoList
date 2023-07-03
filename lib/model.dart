class Todo {
  DateTime createdTime;
  String title;
  String? id;
  String description;
  bool isDone;
  bool? check;

  Todo({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id,
    this.isDone = false,
    this.check,
  });
}
