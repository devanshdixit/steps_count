import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steps_count/app/app.locator.dart';
import 'package:steps_count/app/app.router.dart';

class NewDashboardViewModel extends BaseViewModel {
  // Step Counter
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int current_step = 0, bottomNavigator = 0;
  final _navigationService = locator<NavigationService>();

  void navigateToSharePage() {
    _navigationService.navigateTo(Routes.shareView);
  }

  List<Step> steps = [
    Step(
      title: Text('Step 1'),
      content: Text('Hello!'),
      isActive: true,
    ),
    Step(
      title: Text('Step 2'),
      content: Text('World!'),
      isActive: true,
    ),
  ];

  void setStep(int step) {
    current_step = step;
    notifyListeners();
  }

  void setBottomNavigator(int index) {
    bottomNavigator = index;
    notifyListeners();
  }
}
