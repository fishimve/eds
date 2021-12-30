import 'package:flutter/material.dart';

import 'interface/router.dart';
import 'interface/views/users/users_view.dart';
import 'locator.dart';
import 'services/navigation_service.dart';

void main() async {
  await setupLocator();
  runApp(const EDS());
}

class EDS extends StatelessWidget {
  const EDS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EDS',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const UsersView(),
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
    );
  }
}
