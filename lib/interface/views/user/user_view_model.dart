import 'package:eds_test/locator.dart';
import 'package:eds_test/models/album.dart';
import 'package:eds_test/models/post.dart';
import 'package:eds_test/routes/route_names.dart';
import 'package:eds_test/services/api_service.dart';
import 'package:eds_test/services/database_service.dart';
import 'package:eds_test/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class UserViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();

  final _userPosts = <Post>[];
  List<Post> get userPosts => _userPosts;

  final _userAlbums = <Album>[];
  List<Album> get userAlbums => _userAlbums;

  void getPostsAndAlbums(int userId) async {
    setBusy(true);
    await _getUserPosts(userId);
    await _getUserAlbums(userId);
    setBusy(false);
  }

  Future<void> _getUserPosts(int userId) async {
    List<Post> postsFromDb = await _databaseService.queryPosts();
    if (postsFromDb.isNotEmpty) {
      _userPosts.addAll(postsFromDb);
    } else {
      List<Post> postsFromApi = await _apiService.getUserPosts(userId);
      for (var post in postsFromApi) {
        await _databaseService.insertPost(post);
      }
      _userPosts.addAll(postsFromApi);
    }
  }

  Future<void> _getUserAlbums(int userId) async {
    List<Album> albumsFromDb = await _databaseService.queryAlbums();
    if (albumsFromDb.isNotEmpty) {
      _userAlbums.addAll(albumsFromDb);
    } else {
      List<Album> albumsFromApi = await _apiService.getUserAlbums(userId);
      for (var album in albumsFromApi) {
        await _databaseService.insertAlbum(album);
      }
      _userAlbums.addAll(albumsFromApi);
    }
  }

  Future navigateToPostsView(String username) async {
    await _navigationService.navigateTo(
      postsViewRoute,
      arguments: {
        'username': username,
        'posts': _userPosts,
      },
    );
  }

  Future navigateToAlbumsView(String username) async {
    await _navigationService.navigateTo(
      albumsViewRoute,
      arguments: {
        'username': username,
        'albums': _userAlbums,
      },
    );
  }
}
