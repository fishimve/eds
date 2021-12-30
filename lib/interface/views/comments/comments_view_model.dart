import 'package:eds_test/locator.dart';
import 'package:eds_test/models/comment.dart';
import 'package:eds_test/routes/route_names.dart';
import 'package:eds_test/services/api_service.dart';
import 'package:eds_test/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class CommentsViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();

  final _postComments = <Comment>[];
  List<Comment> get postComments => _postComments;

  void getPostComments(int postId) async {
    setBusy(true);
    List<Comment> commentsFromApi = await _apiService.getPostComments(postId);
    _postComments.addAll(commentsFromApi);
    setBusy(false);
  }

  Future navigateToCreateCommentView(int postId) async {
    await _navigationService.navigateTo(
      createCommentViewRoute,
      arguments: postId,
    );
  }
}
