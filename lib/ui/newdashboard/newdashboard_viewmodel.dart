import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
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

  List<Step> stepsList = [
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

  final navigationService = locator<NavigationService>();
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String status = '?';
  double percentage = 0.01;
  String profilepic = '';
  late Timer timer;
  int timehour = 0;
  int start = 300, steps = 0;
  List intervals = [
    {
      "steps": 0,
    }
  ];

  void updatePercentage() {
    setSteps(steps + 100);
  }

  void onStepCount(StepCount event) {
    print(event);
    setSteps(steps + 1);
    double stp = ((steps / 5000) * 100).toPrecision(2);
    final v = stp / 100;
    if (v >= 0.0 && v <= 1.0) {
      percentage = v;
      notifyListeners();
    }
  }

  void setSteps(int step) {
    steps = step;
    print('updated');
    notifyListeners();
  }

  void setStatus(String statuses) {
    status = statuses;
    notifyListeners();
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setStatus(event.status);
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
          // data.add(FlSpot(1, (start + 3).toDouble()));
          steps = 0;
          start = 300;

          notifyListeners();
          // _databaseApiService.updateSteps(
          //   user: userService.currentUser!,
          //   steps: {
          //     "$start minutes": "${steps.toString()}",
          //   },
          // );
          // log.v('Database updated');
          startTimer();
        } else {
          start--;
          timehour = timehour + 5;
          notifyListeners();
        }
      },
    );
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setStatus("Pedestrian Status not available");
    print(status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setSteps(-1);
  }

  void initPlatformState() async {
    var status = await Permission.activityRecognition.isGranted;
    if (status) {
      print('permission granted');
    } else {
      Permission.activityRecognition.request();
    }
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
  }
}
