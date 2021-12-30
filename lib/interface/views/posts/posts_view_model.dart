import 'package:eds_test/locator.dart';
import 'package:eds_test/models/post.dart';

import 'package:eds_test/routes/route_names.dart';
import 'package:eds_test/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class PostsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future navigateToCommentsView(Post post) async {
    await _navigationService.navigateTo(
      commentsViewRoute,
      arguments: post,
    );
  }
}
