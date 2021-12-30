import 'package:eds_test/locator.dart';
import 'package:eds_test/models/album.dart';
import 'package:eds_test/models/post.dart';
import 'package:eds_test/routes/route_names.dart';
import 'package:eds_test/services/api_service.dart';
import 'package:eds_test/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class UserViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();

  final _userPosts = <Post>[];
  List<Post> get userPosts => _userPosts;

  final _userAlbums = <Album>[];
  List<Album> get userAlbums => _userAlbums;

  void getPostsAndAlbums(int userId) async {
    _getUserPosts(userId);
    _getUserAlbums(userId);
  }

  void _getUserPosts(int userId) async {
    setBusy(true);
    List<Post> postsFromApi = await _apiService.getUserPosts(userId);
    _userPosts.addAll(postsFromApi);
    setBusy(false);
  }

  void _getUserAlbums(int userId) async {
    setBusy(true);
    List<Album> albumsFromApi = await _apiService.getUserAlbums(userId);
    _userAlbums.addAll(albumsFromApi);
    setBusy(false);
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
