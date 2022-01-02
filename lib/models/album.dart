const String albumsTableName = 'albums';

class AlbumsTable {
  static const String id = 'id';
  static const String userId = 'userId';
  static const String title = 'title';
}

class Album {
  final int userId;
  final int id;
  final String title;
  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  static Album fromMap(Map<dynamic, dynamic> map) => Album(
        id: map['id'] as int,
        userId: map['userId'] as int,
        title: map['title'] as String,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'userId': userId,
        'title': title,
      };
}
