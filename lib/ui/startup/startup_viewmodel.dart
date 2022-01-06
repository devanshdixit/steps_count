import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steps_count/api/database_api.dart';
import 'package:steps_count/app/app.locator.dart';
import 'package:steps_count/app/app.logger.dart';
import 'package:steps_count/app/app.router.dart';
import 'package:steps_count/services/user_service.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final userService = locator<UserService>();
  final navigationService = locator<NavigationService>();

  final _databaseApi = locator<DatabaseApi>();
  Future<void> runStartupLogic() async {
    setBusy(true);
    log.v('No user on disk, navigate to the LoginView');
    setBusy(false);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString('user');
    log.wtf(jsonString);
    if (jsonString != null) {
      if (jsonString != "null") {
        final data = await _databaseApi.getUser(userEmail: jsonString);
        userService.setUser(data);
        navigationService.replaceWith(Routes.newDashboardView);
      } else {
        navigationService.replaceWith(Routes.loginView);
      }
    } else {
      navigationService.replaceWith(Routes.loginView);
    }
  }
}
