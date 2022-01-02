const String commentsTableName = 'comments';

class CommentTable {
  static const String id = 'id';
  static const String postId = 'postId';
  static const String name = 'name';
  static const String email = 'email';
  static const String body = 'body';
}

class Comment {
  final int id;
  final int postId;
  final String name;
  final String email;
  final String body;
  Comment({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  static Comment fromMap(Map<dynamic, dynamic> map) => Comment(
        id: map['id'] as int,
        postId: map['postId'] as int,
        name: map['name'] as String,
        email: map['email'] as String,
        body: map['body'] as String,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'postId': postId,
        'name': name,
        'email': email,
        'body': body,
      };
}
