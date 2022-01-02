import 'package:eds_test/locator.dart';
import 'package:eds_test/models/comment.dart';
import 'package:eds_test/services/api_service.dart';
import 'package:eds_test/services/database_service.dart';
import 'package:eds_test/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class CreateCommentViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();

  Future<void> postComment(Comment comment) async {
    setBusy(true);
    await _apiService.postComment(comment);
    _navigateBack();
    setBusy(false);
  }

  void _navigateBack() {
    _navigationService.pop();
  }
}
