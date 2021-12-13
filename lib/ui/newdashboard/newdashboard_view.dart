// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:steps_count/ui/newdashboard/newdashboard_viewmodel.dart';
import 'package:steps_count/ui/shared/ui_helpers.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NewDashboardView extends StatelessWidget {
  const NewDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewDashboardViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            color: Colors.black,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpaceLarge,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Hello',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 30,
                                ),
                              ),
                              horizontalSpaceSmall,
                              Text(
                                'Julietta',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                          verticalSpaceTiny,
                          const Text(
                            'Good morning.',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  verticalSpaceRegular,
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color.fromRGBO(28, 28, 30, 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            CircularPercentIndicator(
                              radius: 140.0,
                              lineWidth: 8.0,
                              animation: true,
                              percent: 0.7,
                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    '05',
                                    style: TextStyle(
                                      fontSize: 32.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Total Steps:',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              linearGradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 94, 92, 230),
                                Color.fromARGB(255, 191, 90, 242),
                                Colors.blue,
                                Colors.blue,
                              ]),
                              restartAnimation: false,
                              circularStrokeCap: CircularStrokeCap.round,
                              backgroundColor: Colors.grey.shade800,
                            ),
                            verticalSpaceSmall,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      width: 15,
                                      height: 15,
                                    ),
                                    horizontalSpaceSmall,
                                    const Text(
                                      '1000 steps',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 191, 90, 242),
                                      width: 2,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(2),
                                  child: const Icon(
                                    Icons.done,
                                    color: Colors.green,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                            verticalSpaceSmall,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 191, 90, 242),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      width: 15,
                                      height: 15,
                                    ),
                                    horizontalSpaceSmall,
                                    const Text(
                                      '3000 steps',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 191, 90, 242),
                                      width: 2,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(2),
                                  child: const Icon(
                                    Icons.done,
                                    color: Colors.green,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                            verticalSpaceSmall,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.deepPurple,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      width: 15,
                                      height: 15,
                                    ),
                                    horizontalSpaceSmall,
                                    const Text(
                                      '5000 steps',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 2,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(2),
                                  child: const Icon(
                                    Icons.done,
                                    color: Colors.grey,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                            verticalSpaceMedium,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 40,
                                ),
                                SizedBox(
                                  width: 160,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    color: Colors.black,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Get your Tokens',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color.fromRGBO(28, 28, 30, 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Reward Status',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          verticalSpaceMedium,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        '1000 Steps',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      verticalSpaceTiny,
                                      Text(
                                        'December 12, 2021',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  MyTooltip(
                                    message: 'check your wallet!',
                                    child: SizedBox(
                                      width: 140,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        color: Colors.black,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 7,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Approved',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              horizontalSpaceSmall,
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                    color: Color.fromARGB(
                                                      255,
                                                      191,
                                                      90,
                                                      242,
                                                    ),
                                                    width: 2,
                                                  ),
                                                ),
                                                child: const Icon(
                                                  Icons.done,
                                                  color: Colors.green,
                                                  size: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              verticalSpaceSmall,
                              Container(
                                height: 1,
                                color: Colors.grey.withOpacity(0.7),
                              ),
                            ],
                          ),
                          verticalSpaceRegular,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        '3000 Steps',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      verticalSpaceTiny,
                                      Text(
                                        'December 12, 2021',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  MyTooltip(
                                    message: 'waiting for approval',
                                    child: SizedBox(
                                      width: 140,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        color: Colors.black,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 7,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Approved',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              horizontalSpaceSmall,
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: const Icon(
                                                  Icons.done,
                                                  color: Colors.grey,
                                                  size: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              verticalSpaceSmall,
                              Container(
                                height: 1,
                                color: Colors.grey.withOpacity(0.7),
                              ),
                            ],
                          ),
                          verticalSpaceRegular,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        '5000 Steps',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      verticalSpaceTiny,
                                      Text(
                                        'December 12, 2021',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () => model.navigateToSharePage(),
                                    child: SizedBox(
                                      width: 140,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        color: Colors.black,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 7,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Share',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              horizontalSpaceSmall,
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: const Icon(
                                                  Icons.share,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              verticalSpaceSmall,
                              Container(
                                height: 1,
                                color: Colors.grey.withOpacity(0.7),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: model.bottomNavigator,
          height: 50.0,
          items: <Widget>[
            Icon(
              model.bottomNavigator == 0 ? Icons.home : Icons.home_outlined,
              size: 30,
              color: model.bottomNavigator == 0
                  ? Colors.white
                  : Color.fromARGB(255, 191, 90, 242),
            ),
            Icon(
              model.bottomNavigator == 1 ? Icons.star : Icons.star_border,
              size: 30,
              color: model.bottomNavigator == 1
                  ? Colors.white
                  : Color.fromARGB(255, 191, 90, 242),
            ),
            Icon(
              model.bottomNavigator == 2
                  ? Icons.compare_arrows
                  : Icons.compare_arrows_rounded,
              size: 30,
              color: model.bottomNavigator == 2
                  ? Colors.white
                  : Color.fromARGB(255, 191, 90, 242),
            ),
            Icon(
              model.bottomNavigator == 3
                  ? Icons.receipt
                  : Icons.receipt_outlined,
              size: 30,
              color: model.bottomNavigator == 3
                  ? Colors.white
                  : Color.fromARGB(255, 191, 90, 242),
            ),
            Icon(
              model.bottomNavigator == 4
                  ? Icons.person
                  : Icons.perm_identity_outlined,
              size: 30,
              color: model.bottomNavigator == 4
                  ? Colors.white
                  : Color.fromARGB(255, 191, 90, 242),
            ),
          ],
          color: Color.fromRGBO(28, 28, 30, 1),
          buttonBackgroundColor: Color.fromRGBO(28, 28, 30, 1),
          backgroundColor: Colors.black,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 250),
          onTap: (index) {
            model.setBottomNavigator(index);
          },
          letIndexChange: (index) => true,
        ),
      ),
      viewModelBuilder: () => NewDashboardViewModel(),
    );
  }
}

class MilestoneProgress extends StatelessWidget {
  final double width;
  final double maxIconSize;
  final int totalMilestones;
  final int completedMilestone;
  final IconData completedIconData;
  final IconData nonCompletedIconData;
  final Color completedIconColor;
  final Color incompleteIconColor;

  MilestoneProgress(
      {required this.width,
      this.maxIconSize = 24,
      required this.totalMilestones,
      required this.completedMilestone,
      this.completedIconData = Icons.check_circle,
      this.nonCompletedIconData = Icons.adjust,
      this.completedIconColor = Colors.green,
      this.incompleteIconColor = Colors.grey})
      : assert(width != null),
        assert(totalMilestones != null),
        assert(completedMilestone != null),
        assert(totalMilestones != null);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: getTitleWithMilestone(
            width,
            totalMilestones,
            completedMilestone,
            completedIconData,
            nonCompletedIconData,
            completedIconColor,
            incompleteIconColor,
            maxIconSize));
  }
}

List<Widget> getTitleWithMilestone(
    double width,
    int totalPoints,
    int checkedPoints,
    IconData completedIconData,
    IconData nonCompletedIconData,
    Color completedIconColor,
    Color incompleteIconColor,
    double mxIconSize) {
  List<Widget> list = <Widget>[];
  double iconSizeTemp = width / (1.5 * totalPoints);
  double lineSizeTemp = width / (3 * totalPoints);
  double maxIconSize = mxIconSize;
  double maxLineSize = mxIconSize / 2;

  // checks and adjusts icon size acc to max width
  double iconSize = iconSizeTemp > maxIconSize ? maxIconSize : iconSizeTemp;
  double lineSize = lineSizeTemp > maxLineSize ? maxLineSize : lineSizeTemp;

  for (int i = 0; i < (2 * totalPoints) - 1; i++) {
    if (i % 2 == 0) {
      list.add(Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            )),
        child: Icon(
          i <= (2 * checkedPoints) - 1
              ? completedIconData
              : nonCompletedIconData,
          size: iconSize,
          color: i <= (2 * checkedPoints) - 1
              ? completedIconColor
              : incompleteIconColor,
        ),
      ));
    } else {
      list.add(SizedBox(
        height: 10,
        width: lineSize,
        child: Container(
          color: i < (2 * checkedPoints) - 1
              ? completedIconColor
              : incompleteIconColor,
        ),
      ));
    }
  }
  return list;
}

class MyTooltip extends StatelessWidget {
  final Widget child;
  final String message;

  MyTooltip({required this.message, required this.child});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      key: key,
      message: message,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onTap(key),
        child: child,
      ),
    );
  }

  void _onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
  }
}
