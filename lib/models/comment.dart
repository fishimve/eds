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

  static Comment fromMap(Map<String, dynamic> map) => Comment(
        id: map.containsKey('id') ? map['id'] : 0,
        postId: map.containsKey('postId') ? map['postId'] : '-',
        name: map.containsKey('name') ? map['name'] : '-',
        email: map.containsKey('email') ? map['email'] : '-',
        body: map.containsKey('body') ? map['body'] : '-',
      );
}
