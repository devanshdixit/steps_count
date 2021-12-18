import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_firebase_auth/src/firebase_authentication_service.dart';
import 'package:steps_count/api/database_api.dart';
import 'package:steps_count/app/app.locator.dart';
import 'package:steps_count/app/app.router.dart';
import 'package:steps_count/models/application_models.dart';
import 'package:steps_count/ui/base/authentication_viewmodel.dart';
import 'package:steps_count/ui/createaccount/createaccount_view.form.dart';

class CreateAccountViewModel extends AuthenticationViewModel {
  CreateAccountViewModel() : super(successRoute: Routes.newDashboardView);
  final FirebaseAuthenticationService? _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService!.loginWithEmail(
        email: EmailValueKey,
        password: PasswordValueKey,
      );

  bool passenable = true;
  bool passenable1 = true;
  final _databaseApi = locator<DatabaseApi>();

  void createAccount({
    required String name,
    required String telegramId,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    setBusy(true);
    final res = await _databaseApi.createUser(
      confirmPassword: confirmPassword,
      email: email,
      name: name,
      password: password,
      telegramId: telegramId,
    );
    if (res['success']) {
      log.wtf(res);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', res['data']['email'].toString());
      final email = res['data']['email'];
      final data = await _databaseApi.getUser(userEmail: email);
      userService.setUser(data);
      log.wtf(userService.currentUser!.userName);
      navigationService.clearStackAndShow(Routes.startUpView);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email or Password is Incorrect, Please try again!'),
        ),
      );
    }
    setBusy(false);
  }

  void setPassEnable(bool bool) {
    passenable = bool;
    notifyListeners();
  }

  void setPassEnable1(bool bool) {
    passenable = bool;
    notifyListeners();
  }
}
