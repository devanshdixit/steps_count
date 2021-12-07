import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:steps_count/location_tracker.dart';

class MyApps extends StatefulWidget {
  @override
  _MyAppsState createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?';
  double percentage = 0;
  late Timer _timer;
  int _start = 20, _steps = 0;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = _steps + 1;
      //  percentage = ((event.steps / 10000) * 100).toDouble();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _steps = 0;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = -1;
    });
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

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pedometer example app'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              CircularPercentIndicator(
                radius: 160.0,
                lineWidth: 13.0,
                animation: true,
                percent: percentage,
                center: Text(
                  _steps.toString(),
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                header: Column(
                  children: const [
                    Text(
                      'Steps taken:',
                      style: TextStyle(
                        fontSize: 40.0,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.blue.shade100,
                progressColor: Colors.blue.shade700,
              ),
              const SizedBox(
                height: 30,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {
              //         setState(() {
              //           percentage = percentage - 0.1;
              //         });
              //       },
              //       child: Text("start"),
              //     ),
              //     const SizedBox(
              //       width: 30,
              //     ),
              //     ElevatedButton(
              //       onPressed: () {
              //         setState(() {
              //           percentage = percentage + 0.1;
              //         });
              //       },
              //       child: Text("Restart"),
              //     ),
              //   ],
              // ),
              //Text("$_start"),
              const SizedBox(
                height: 30,
              ),
              SizedBox(height: 400, child: BackMap())
            ],
          ),
        ),
      ),
    );
  }
}
