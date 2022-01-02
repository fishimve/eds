import 'package:eds_test/locator.dart';
import 'package:eds_test/models/comment.dart';
import 'package:eds_test/routes/route_names.dart';
import 'package:eds_test/services/api_service.dart';
import 'package:eds_test/services/database_service.dart';
import 'package:eds_test/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class CommentsViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();

  final _postComments = <Comment>[];
  List<Comment> get postComments => _postComments;

  void getPostComments(int postId) async {
    setBusy(true);
    List<Comment> commentsFromDb = await _databaseService.queryComments(postId);
    if (commentsFromDb.isNotEmpty) {
      _postComments.addAll(commentsFromDb);
    } else {
      List<Comment> commentsFromApi = await _apiService.getPostComments(postId);
      for (var comment in commentsFromApi) {
        await _databaseService.insertComment(comment);
      }
      _postComments.addAll(commentsFromApi);
    }
    setBusy(false);
  }

  Future navigateToCreateCommentView(int postId) async {
    await _navigationService.navigateTo(
      createCommentViewRoute,
      arguments: postId,
    );
  }
}
