import 'package:eds_test/locator.dart';
import 'package:eds_test/models/user.dart';
import 'package:eds_test/routes/route_names.dart';
import 'package:eds_test/services/api_service.dart';
import 'package:eds_test/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class UsersViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();

  final _users = <User>[];
  List<User> get users => _users;

  void getUsers() async {
    setBusy(true);
    List<User> usersFromApi = await _apiService.getUsers();
    _users.addAll(usersFromApi);
    setBusy(false);
  }

  Future navigateToUserView(int index) async {
    await _navigationService.navigateTo(
      userViewRoute,
      arguments: _users[index],
    );
  }
}
