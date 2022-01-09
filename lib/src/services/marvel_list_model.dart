class MarvelList {
  // {userId: 1, id: 1, title: delectus aut autem, completed: false}

  final int id;
  final int userId;
  final String title;
  final bool completed;

  MarvelList(
      this.id,
      this.userId,
      this.title,
      this.completed,
      );

  MarvelList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        title = json['title'],
        completed = json['completed'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'title': title,
    'completed': completed,
  };
}