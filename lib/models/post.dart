class Post {
  final int id;
  final int userId;
  final String title;
  final String body;
  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  static Post fromMap(Map<String, dynamic> map) => Post(
        id: map.containsKey('id') ? map['id'] : 0,
        userId: map.containsKey('userId') ? map['userId'] : 0,
        title: map.containsKey('title') ? map['title'] : '-',
        body: map.containsKey('body') ? map['body'] : '-',
      );
}
