import 'package:eds_test/locator.dart';
import 'package:eds_test/routes/route_names.dart';
import 'package:eds_test/services/database_service.dart';
import 'package:eds_test/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();

  Future initialise() async {
    await _databaseService.initialiseDb();
    await _navigationService.navigateReplaceTo(usersViewRoute);
  }
}
