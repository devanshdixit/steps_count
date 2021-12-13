import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steps_count/app/app.locator.dart';
import 'package:steps_count/app/app.router.dart';

class ShareViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateBack() {
    _navigationService.back();
  }
}
