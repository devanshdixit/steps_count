import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steps_count/api/database_api.dart';
import 'package:steps_count/app/app.locator.dart';
import 'package:steps_count/app/app.logger.dart';
import 'package:steps_count/app/app.router.dart';
import 'package:steps_count/services/user_service.dart';

class NewDashboardViewModel extends BaseViewModel {
  final log = getLogger('NewDashboardViewModel');
  final userService = locator<UserService>();
  final navigationService = locator<NavigationService>();
  final _databaseApiService = locator<DatabaseApi>();
  int current_step = 0, bottomNavigator = 0;
  final _navigationService = locator<NavigationService>();
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String status = '?';
  double percentage = 0.01;
  String profilepic = '';
  late Timer timer;
  int timehour = 0;
  int start = 600, steps = 0;
  List intervals = [
    {
      "steps": 0,
    }
  ];

  void navigateToSharePage() {
    _navigationService.navigateTo(Routes.shareView);
  }

  List<Step> stepsList = const [
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

  void updatePercentage() {
    setSteps(steps + 100);
  }

  void onStepCount(StepCount event) {
    log.wtf('steps counted');
    setSteps(steps + 1);
    double stp = ((steps / 5000) * 100).toPrecision(2);
    final v = stp / 100;
    if (v >= 0.0 && v <= 1.0) {
      percentage = v;
      notifyListeners();
    }
    notifyListeners();
  }

  void setSteps(int step) {
    steps = step;
    notifyListeners();
  }

  void setStatus(String statuses) {
    status = statuses;
    notifyListeners();
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    setStatus(event.status);
    log.wtf(event.status);
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
          start = 600;
          notifyListeners();
          _databaseApiService.updateSteps(
            user: userService.currentUser!,
            steps: {
              "$start minutes": "${steps.toString()}",
            },
          );
          log.wtf("$start minutes ${steps.toString()}");
          log.v('Database updated');
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
    setStatus("Pedestrian Status not available");
  }

  void onStepCountError(error) {
    setStatus('onStepCountError: $error');
    setSteps(-1);
  }

  void initPlatformState() async {
    var status = await Permission.activityRecognition.isGranted;
    if (!status) {
      Permission.activityRecognition.request();
    }
    log.v('pedestriam started');

    /// Init streams
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _stepCountStream = Pedometer.stepCountStream;

    /// Listen to streams and handle errors
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);
  }

  void updateUserSteps(int i, int j) {}
}
