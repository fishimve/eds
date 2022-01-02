import 'package:get_it/get_it.dart';

import 'services/api_service.dart';
import 'services/database_service.dart';
import 'services/navigation_service.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => DatabaseService());

}
