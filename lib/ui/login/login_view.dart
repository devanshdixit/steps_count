import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:steps_count/ui/login/authentication_layout.dart';
import 'package:steps_count/ui/shared/ui_helpers.dart';

import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) {
        return Scaffold(
            body: Center(
          child: AuthenticationLayout(
            busy: model.isBusy,
            onMainButtonTapped: model.saveData,
            onCreateAccountTapped: model.navigateToCreateAccount,
            validationMessage: model.validationMessage,
            mainButtonTitle: 'SIGN IN',
            onForgotPassword: () {},
            onSignInWithGoogle: model.useGoogleAuthentication,
            onSignInWithApple: model.useAppleAuthentication,
          ),
        ));
      },
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
