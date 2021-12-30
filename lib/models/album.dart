class Album {
  final int userId;
  final int id;
  final String title;
  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  static Album fromMap(Map<String, dynamic> map) => Album(
        id: map.containsKey('id') ? map['id'] : 0,
        userId: map.containsKey('userId') ? map['userId'] : 0,
        title: map.containsKey('title') ? map['title'] : '-',
      );
}
