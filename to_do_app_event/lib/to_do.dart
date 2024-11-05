class ToDo {
  int? id;
  String title;
  bool isDone;

  ToDo({
    this.id,
    required this.title,
    this.isDone = false,
  });

  void toggleDone() {
    isDone = !isDone;
  }

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      title: json['title'],
      isDone: json['isDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }
}
