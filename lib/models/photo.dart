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

  static Photo fromMap(Map<String, dynamic> map) => Photo(
        id: map.containsKey('id') ? map['id'] : 0,
        albumId: map.containsKey('albumId') ? map['albumId'] : 0,
        title: map.containsKey('title') ? map['title'] : '-',
        url: map.containsKey('url') ? map['url'] : '-',
        thumbnailUrl:
            map.containsKey('thumbnailUrl') ? map['thumbnailUrl'] : '-',
      );
}
