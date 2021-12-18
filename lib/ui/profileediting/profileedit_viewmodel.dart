import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class ProfileEditViewModel extends BaseViewModel {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController telegramEditingController = TextEditingController();

  void setListeners(String email, String name, String telgramId) {
    nameEditingController.text = name;
    emailEditingController.text = email;
    telegramEditingController.text = telgramId;
    notifyListeners();
    nameEditingController.addListener(() {});
    emailEditingController.addListener(() {});
    telegramEditingController.addListener(() {});
  }
}
