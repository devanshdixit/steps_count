import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:steps_count/ui/daily_steps_page.dart';
import 'package:steps_count/ui/dashboard/database_viewmodel.dart';
import 'package:steps_count/ui/location_tracker.dart';
import 'package:steps_count/ui/shared/ui_helpers.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      onModelReady: (model) {
        model.startTimer();
        model.initPlatformState();
        model.setProfilePic();
      },
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey.shade200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => model.logout(),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90.0),
                          child: Image.network(
                            model.profilepic,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    horizontalSpaceSmall,
                  ],
                ),
                CircularPercentIndicator(
                  radius: 160.0,
                  lineWidth: 13.0,
                  animation: true,
                  percent: model.percentage,
                  center: Text(
                    model.steps.toString(),
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
                      Container(
                        color: Colors.red,
                        child: IconButton(
                          onPressed: () => model.testapi(),
                          icon: Icon(Icons.edit, color: Colors.black),
                        ),
                      ),
                      verticalSpaceRegular,
                      DurationWidget(
                          percentage: model.percentage, steps: model.steps),
                      verticalSpaceRegular,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: LineChartSample1(
                          datas: model.data,
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
      onDispose: (model) {
        model.timer.cancel();
      },
      viewModelBuilder: () => DashboardViewModel(),
    );
  }
}
