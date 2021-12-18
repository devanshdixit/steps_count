import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steps_count/app/app.locator.dart';
import 'package:steps_count/app/app.logger.dart';
import 'package:steps_count/app/app.router.dart';
import 'package:steps_count/services/user_service.dart';

class ProfileViewModel extends BaseViewModel {
  final log = getLogger('NewDashboardViewModel');
  final _navigationService = locator<NavigationService>();
  final userService = locator<UserService>();

  String name = 'Jullieta Johnson',
      email = 'jullietajohnson@gmail.com',
      telegramId = '@jullieta',
      createdAt = '',
      updatedAt = '',
      photourl = '';

  void navigateToProfileedit() {
    _navigationService.navigateTo(
      Routes.profileEditView,
      arguments: ProfileEditViewArguments(
        email: email,
        name: name,
        telgramId: telegramId,
        createdAt: createdAt,
      ),
    );
  }

  void setUser() {
    name = userService.currentUser!.userName!;
    email = userService.currentUser!.email!;
    telegramId = userService.currentUser!.telegramId!;
    createdAt = userService.currentUser!.createdAt!;
    updatedAt = userService.currentUser!.updatedAt!;
    photourl = userService.currentUser!.photourl!;
    notifyListeners();
  }

  Future<void> logout() async {
    await userService.logout;
    log.v('Successfully Logged out');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    userService.setUser(null);
    runStartupLogic();
  }

  Future<void> runStartupLogic() async {
    setBusy(true);
    if (userService.hasLoggedInUser || userService.currentUser != null) {
      log.v('We have a user session on disk. Sync the user profile ...');
      await userService.syncUserAccount();
      log.v('User sync complete. User profile');
      setBusy(false);
      _navigationService.replaceWith(Routes.dashboardView);
    } else {
      log.v('No user on disk, navigate to the LoginView');
      setBusy(false);
      _navigationService.replaceWith(Routes.loginView);
    }
  }
}
