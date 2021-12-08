import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:steps_count/location_tracker.dart';
import 'package:steps_count/ui_helpers.dart';

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
  int timehour = 0;
  int _start = 20, _steps = 0;
  List intervals = [
    {
      "steps": 3,
    }
  ];
  @override
  void initState() {
    startTimer();
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = _steps + 1;
    });
    print(((event.steps / 10000) * 100).toDouble());
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
            data.add(FlSpot(1, (_start + 3).toDouble()));
            _steps = 0;
            _start = 20;
          });

          startTimer();
        } else {
          setState(() {
            _start--;
            timehour = timehour + 5;
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

  List<FlSpot> data = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.grey.shade200,
          actions: [
            Container(
              width: 50,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person),
            ),
            horizontalSpaceRegular,
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey.shade200,
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
                  footer: Column(
                    children: const [
                      verticalSpaceSmall,
                      Text(
                        'steps count',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
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
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      verticalSpaceMedium,
                      DurationWidget(percentage: percentage, steps: _steps),
                      verticalSpaceRegular,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: LineChartSample1(
                          datas: data,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ListTile(
                        title: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Track your Workout",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(height: 400, child: BackMap()),
                              ],
                            ),
                          ),
                        ),
                      ),
                      verticalSpaceMedium,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DurationWidget extends StatelessWidget {
  const DurationWidget({
    Key? key,
    required this.percentage,
    required int steps,
  }) : super(key: key);

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Worked Duration",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.orange,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    CircularPercentIndicator(
                      radius: 80.0,
                      lineWidth: 10.0,
                      animation: true,
                      percent: 0.4,
                      center: const Icon(
                        Icons.directions_run_outlined,
                        color: Colors.orange,
                        size: 38,
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.orange.shade100,
                      progressColor: Colors.orange.shade700,
                    ),
                    horizontalSpaceRegular,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Running",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        verticalSpaceTiny,
                        Text(
                          '52 hours, 2min',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              verticalSpaceMedium,
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.teal,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    CircularPercentIndicator(
                      radius: 80.0,
                      lineWidth: 10.0,
                      animation: true,
                      percent: 0.4,
                      center: SizedBox(
                        height: 35,
                        width: 35,
                        child: Image.asset(
                          "assets/images/bicycle.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.teal.shade100,
                      progressColor: Colors.teal.shade600,
                    ),
                    horizontalSpaceRegular,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Cycling",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        verticalSpaceTiny,
                        Text(
                          '23 hours, 45min',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.teal,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              verticalSpaceMedium,
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(190, 69, 209, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    CircularPercentIndicator(
                      radius: 80.0,
                      lineWidth: 10.0,
                      animation: true,
                      percent: 0.4,
                      center: SizedBox(
                        height: 35,
                        width: 35,
                        child: Image.asset(
                          "assets/images/yoga.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: const Color.fromRGBO(190, 69, 209, 1)
                          .withOpacity(0.3),
                      progressColor: const Color.fromRGBO(190, 69, 209, 1),
                    ),
                    horizontalSpaceRegular,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Yoga",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        verticalSpaceTiny,
                        Text(
                          '52 hours, 2min',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(190, 69, 209, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LineChartSample1 extends StatefulWidget {
  LineChartSample1({Key? key, required this.datas}) : super(key: key);
  List<FlSpot> datas;
  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          gradient: LinearGradient(
            colors: [
              Color(0xff2c274c),
              Color(0xff46426c),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 37,
                ),
                const Text(
                  'Todays Steps',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 37,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                    child: _LineChart(
                      isShowingMainData: !isShowingMainData,
                      data: widget.datas,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            // IconButton(
            //   icon: Icon(
            //     Icons.refresh,
            //     color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
            //   ),
            //   onPressed: () {
            //     setState(() {
            //       isShowingMainData = !isShowingMainData;
            //     });
            //   },
            // )
          ],
        ),
      ),
    );
  }
}

class _LineChart extends StatelessWidget {
  _LineChart({required this.isShowingMainData, required this.data});

  final bool isShowingMainData;
  List<FlSpot> data;
  @override
  Widget build(BuildContext context) {
    return LineChart(
      isShowingMainData ? sampleData1 : sampleData2,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 24,
        maxY: 5,
        minY: 0,
      );

  LineChartData get sampleData2 => LineChartData(
        lineTouchData: lineTouchData2,
        gridData: gridData,
        titlesData: titlesData2,
        borderData: borderData,
        lineBarsData: lineBarsData2,
        minX: 0,
        maxX: 14,
        maxY: 6,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: bottomTitles,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        leftTitles: leftTitles(
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '100';
              case 2:
                return '500';
              case 3:
                return '1000';
              case 4:
                return '5000';
              case 5:
                return '10000';
            }
            return '';
          },
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

  LineTouchData get lineTouchData2 => LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: bottomTitles,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        leftTitles: leftTitles(
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '100';
              case 2:
                return '500';
              case 3:
                return '1000';
              case 4:
                return '5000';
              case 5:
                return '8000';
            }
            return '';
          },
        ),
      );

  List<LineChartBarData> get lineBarsData2 => [
        lineChartBarData2_1,
      ];

  SideTitles leftTitles({required GetTitleFunction getTitles}) => SideTitles(
        getTitles: getTitles,
        showTitles: true,
        margin: 16,
        interval: 1,
        reservedSize: 40,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xff75729e),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 22,
        margin: 10,
        interval: 1,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xff72719b),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return '20m';
            case 7:
              return '60m';
            case 12:
              return '120m';
          }
          return '';
        },
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color(0xff4e4965), width: 4),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        colors: [const Color(0xff4af699)],
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 1.5),
          FlSpot(5, 1.4),
          FlSpot(7, 3.4),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        colors: [const Color(0xffaa4cfc)],
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false, colors: [
          const Color(0x00aa4cfc),
        ]),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
      );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: true,
        colors: const [Color(0xff27b6fc)],
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 2.8),
          FlSpot(3, 1.9),
          FlSpot(6, 3),
          FlSpot(10, 1.3),
          FlSpot(13, 2.5),
        ],
      );

  LineChartBarData get lineChartBarData2_1 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        colors: const [Color(0x444af699)],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: data,
      );

  LineChartBarData get lineChartBarData2_2 => LineChartBarData(
        isCurved: true,
        colors: const [Color(0x99aa4cfc)],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          colors: [
            const Color(0x33aa4cfc),
          ],
        ),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
      );

  LineChartBarData get lineChartBarData2_3 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        colors: const [Color(0x4427b6fc)],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 3.8),
          FlSpot(3, 1.9),
          FlSpot(6, 5),
          FlSpot(10, 3.3),
          FlSpot(13, 4.5),
        ],
      );
}
