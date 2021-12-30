import 'package:eds_test/locator.dart';
import 'package:eds_test/routes/route_names.dart';
import 'package:eds_test/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class AlbumsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future navigateToPhotosView(int albumId, {bool slideshow = false}) async {
    await _navigationService.navigateTo(
      photosViewRoute,
      arguments: {
        'albumId': albumId,
        'slideshow': slideshow,
      },
    );
  }
}
