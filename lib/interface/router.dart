import 'package:eds_test/models/album.dart';
import 'package:eds_test/models/post.dart';
import 'package:eds_test/models/user.dart';
import 'package:eds_test/routes/route_names.dart';
import 'package:flutter/material.dart';

import 'views/albums/albums_view.dart';
import 'views/comments/comments_view.dart';
import 'views/create_comment/create_comment_view.dart';
import 'views/photos/photos_view.dart';
import 'views/posts/posts_view.dart';
import 'views/user/user_view.dart';
import 'views/users/users_view.dart';

PageRoute _pageRoute({required String routeName, required Widget view}) {
  return MaterialPageRoute(
    settings: RouteSettings(name: routeName),
    builder: (_) => view,
  );
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case usersViewRoute:
      return _pageRoute(
        routeName: settings.name!,
        view: const UsersView(),
      );
    case userViewRoute:
      final user = settings.arguments as User;
      return _pageRoute(
        routeName: settings.name!,
        view: UserView(user: user),
      );
    case postsViewRoute:
      final userPosts = settings.arguments as Map<String, dynamic>;
      return _pageRoute(
        routeName: settings.name!,
        view: PostsView(
          posts: userPosts['posts'] as List<Post>,
          username: userPosts['username'] as String,
        ),
      );
    case albumsViewRoute:
      final userAlbums = settings.arguments as Map<String, dynamic>;
      return _pageRoute(
        routeName: settings.name!,
        view: AlbumsView(
          albums: userAlbums['albums'] as List<Album>,
          username: userAlbums['username'] as String,
        ),
      );
    case commentsViewRoute:
      final post = settings.arguments as Post;
      return _pageRoute(
        routeName: settings.name!,
        view: CommentsView(post: post),
      );
    case createCommentViewRoute:
      final postId = settings.arguments as int;
      return _pageRoute(
        routeName: settings.name!,
        view: CreateCommentView(postId: postId),
      );
    case photosViewRoute:
      final albumIdAndSlide = settings.arguments as Map<String, dynamic>;
      return _pageRoute(
        routeName: settings.name!,
        view: PhotosView(
          albumId: albumIdAndSlide['albumId'] as int,
          slideshow: albumIdAndSlide['slideshow'] as bool,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
              child: Container(
            height: 50,
            width: 50,
            color: Colors.red.shade300,
          )),
        ),
      );
  }
}
