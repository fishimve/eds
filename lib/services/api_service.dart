import 'dart:convert';

import 'package:eds_test/models/album.dart';
import 'package:eds_test/models/comment.dart';
import 'package:eds_test/models/photo.dart';
import 'package:eds_test/models/post.dart';
import 'package:eds_test/models/user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const endpoint = 'https://jsonplaceholder.typicode.com';

  var client = http.Client();

  Future getUsers() async {
    final users = <User>[];
    var response = await client.get(Uri.parse('$endpoint/users'));
    var parsed = json.decode(response.body);

    for (var user in parsed) {
      var u = User.fromMap(user);
      users.add(u);
    }
    return users;
  }

  Future getUserPosts(int userId) async {
    final posts = <Post>[];
    var response = await client.get(Uri.parse('$endpoint/users/$userId/posts'));
    var parsed = json.decode(response.body);

    for (var post in parsed) {
      var p = Post.fromMap(post);
      posts.add(p);
    }
    return posts;
  }

  Future getUserAlbums(int userId) async {
    final albums = <Album>[];
    var response =
        await client.get(Uri.parse('$endpoint/users/$userId/albums'));
    var parsed = json.decode(response.body);

    for (var album in parsed) {
      var a = Album.fromMap(album);
      albums.add(a);
    }
    return albums;
  }

  Future getPostComments(int postId) async {
    final comments = <Comment>[];
    var response =
        await client.get(Uri.parse('$endpoint/posts/$postId/comments'));
    var parsed = json.decode(response.body);

    for (var comment in parsed) {
      var c = Comment.fromMap(comment);
      comments.add(c);
    }
    return comments;
  }

  Future<void> postComment(Comment comment) async {
    var url = Uri.parse('$endpoint/posts');
    var response = await http.post(url, body: {
      'name': comment.name,
      'body': comment.body,
    });
    // ignore: avoid_print
    print('Response status: ${response.statusCode}');
    // ignore: avoid_print
    print('Response body: ${response.body}');
  }

  Future getAlbumPhotos(int albumId) async {
    final photos = <Photo>[];
    var response =
        await client.get(Uri.parse('$endpoint/albums/$albumId/photos'));
    var parsed = json.decode(response.body);

    for (var photo in parsed) {
      var p = Photo.fromMap(photo);
      photos.add(p);
    }
    return photos;
  }
}
