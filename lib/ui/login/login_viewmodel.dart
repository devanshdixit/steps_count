import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:steps_count/api/database_api.dart';
import 'package:steps_count/app/app.locator.dart';
import 'package:steps_count/app/app.router.dart';
import 'package:steps_count/ui/base/authentication_viewmodel.dart';
import 'login_view.form.dart';

class LoginViewModel extends AuthenticationViewModel {
  final FirebaseAuthenticationService? _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  final _databaseApi = locator<DatabaseApi>();
  String pass = "admin";
  String animationType = "idle";
  bool isEmailValid = true, passenable = true, isPasswordValid = true;
  LoginViewModel() : super(successRoute: Routes.newDashboardView);
  updatePass(String val) {
    pass = val;
    notifyListeners();
  }

  updateAnimationType(String val) {
    animationType = val;
    notifyListeners();
  }

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService!.loginWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );

  void login(String email, String password, BuildContext context) async {
    setBusy(true);
    final res = await _databaseApi.loginUser(email: email, password: password);
    if (res['success']) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final emailid =
          res['data']['email'] == email ? res['data']['email'] : email;
      prefs.setString('user', emailid.toString());
      final data = await _databaseApi.getUser(userEmail: emailid);
      userService.setUser(data);
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

  void navigateToCreateAccount() {
    navigationService.navigateTo(Routes.createAccountView);
  }
}
