class Todo {
  final String id;
  final String title;
  final String description;
  final bool isDone;

  const Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.isDone,
  });

  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        isDone = json['isDone'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'isDone': isDone,
      };
}
