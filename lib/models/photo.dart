const String photosTableName = 'photos';

class PhotosTable {
  static const String id = 'id';
  static const String albumId = 'albumId';
  static const String title = 'title';
  static const String url = 'url';
  static const String thumbnailUrl = 'thumbnailUrl';
}

class Photo {
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;
  Photo({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  static Photo fromMap(Map<dynamic, dynamic> map) => Photo(
        id: map['id'] as int,
        albumId: map['albumId'] as int,
        title: map['title'] as String,
        url: map['url'] as String,
        thumbnailUrl: map['thumbnailUrl'] as String,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'albumId': albumId,
        'title': title,
        'url': url,
        'thumbnailUrl': thumbnailUrl,
      };
}
