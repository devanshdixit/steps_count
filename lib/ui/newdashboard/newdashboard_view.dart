// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:steps_count/ui/buysell/buysell_view.dart';
import 'package:steps_count/ui/newdashboard/newdashboard_viewmodel.dart';
import 'package:steps_count/ui/profile/profile_view.dart';
import 'package:steps_count/ui/shared/constants.dart';
import 'package:steps_count/ui/shared/ui_helpers.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:lottie/lottie.dart';

class NewDashboardView extends StatelessWidget {
  const NewDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewDashboardViewModel>.reactive(
      onModelReady: (model) {
        model.startTimer();
        model.initPlatformState();
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color.fromRGBO(28, 28, 30, 1),
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'FITI5',
              style: TextStyle(
                letterSpacing: 1,
                fontSize: 26,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
            )
          ],
        ),
        backgroundColor: Colors.black,
        body: model.bottomNavigator == 2
            ? BuySellView()
            : model.bottomNavigator == 4
                ? ProfileView()
                : model.bottomNavigator == 0
                    ? Home(
                        model: model,
                      )
                    : Center(
                        child: Text(
                          'Coming Soon!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
        bottomNavigationBar: CurvedNavigationBar(
          index: model.bottomNavigator,
          height: 70.0,
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
          backgroundColor: Colors.transparent,
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

class Home extends StatelessWidget {
  const Home({
    Key? key,
    required this.model,
  }) : super(key: key);
  final NewDashboardViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpaceRegular,
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
                        percent: model.percentage,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              model.steps.toString(),
                              style: TextStyle(
                                fontSize: 32.0,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
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
                            width: 50,
                            height: 40,
                            padding: EdgeInsets.all(2),
                            child: Lottie.asset(
                              Assets.done,
                              repeat: false,
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
                                  color: Color.fromARGB(255, 191, 90, 242),
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
                            width: 50,
                            height: 40,
                            padding: EdgeInsets.all(2),
                            child: Lottie.asset(
                              Assets.done,
                              repeat: false,
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
                                    Radius.circular(20),
                                  ),
                                ),
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
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              '- - - -',
                              style: TextStyle(
                                color: Colors.white,
                              ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    borderRadius: BorderRadius.circular(20.0),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    borderRadius: BorderRadius.circular(20.0),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    borderRadius: BorderRadius.circular(20.0),
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
    );
  }
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
