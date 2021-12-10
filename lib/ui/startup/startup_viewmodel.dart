import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steps_count/app/app.locator.dart';
import 'package:steps_count/app/app.logger.dart';
import 'package:steps_count/app/app.router.dart';
import 'package:steps_count/main.dart';
import 'package:steps_count/services/user_service.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final userService = locator<UserService>();
  final navigationService = locator<NavigationService>();

  Future<void> runStartupLogic() async {
    setBusy(true);
    if (userService.hasLoggedInUser) {
      log.v('We have a user session on disk. Sync the user profile ...');
      await userService.syncUserAccount();
      final currentUser = userService.currentUser;
      log.v('User sync complete. User profile: $currentUser');
      setBusy(false);
      navigationService.replaceWith(Routes.dashboardView);
    } else {
      log.v('No user on disk, navigate to the LoginView');
      setBusy(false);
      navigationService.replaceWith(Routes.loginView);
    }
  }
}
