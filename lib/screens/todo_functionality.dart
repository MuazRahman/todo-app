class Todo{
  String title;
  String description;
  todoStatus status;

  Todo({required this.title, required this.description, this.status = todoStatus.idle});
}

enum todoStatus{
  idle,
  inProgress,
  done
}