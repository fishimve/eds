const String postsTableName = 'posts';

class PostsTable {
  static const String id = 'id';
  static const String userId = 'userId';
  static const String title = 'title';
  static const String body = 'body';
}

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

  static Post fromMap(Map<dynamic, dynamic> map) => Post(
        id: map['id'] as int,
        userId: map['userId'] as int,
        title: map['title'] as String,
        body: map['body'] as String,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      };
}
