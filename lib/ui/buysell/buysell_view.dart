import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steps_count/ui/buysell/buysell_viewmodel.dart';
import 'package:steps_count/ui/shared/ui_helpers.dart';

class BuySellView extends StatelessWidget {
  const BuySellView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BuySellViewModel>.reactive(
      onModelReady: (model) {
        model.setListeners();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceRegular,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth(context) / 2.6,
                        child: Column(
                          children: [
                            const Text(
                              'Select Token',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            verticalSpaceSmall,
                            GestureDetector(
                              onTap: () => model.setChooseVal('BTC'),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: const Color.fromRGBO(28, 28, 30, 1),
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: model.chosenValue == 'BTC'
                                          ? const Color.fromARGB(
                                              255, 191, 90, 242)
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'BTC',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Visibility(
                                        visible: model.chosenValue == "BTC"
                                            ? true
                                            : false,
                                        child: const Icon(
                                          Icons.done,
                                          color:
                                              Color.fromARGB(255, 191, 90, 242),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => model.setChooseVal('ETH'),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: const Color.fromRGBO(28, 28, 30, 1),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: model.chosenValue == 'ETH'
                                          ? const Color.fromARGB(
                                              255, 191, 90, 242)
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 45,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'ETH',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Visibility(
                                        visible: model.chosenValue == "ETH"
                                            ? true
                                            : false,
                                        child: const Icon(
                                          Icons.done,
                                          color:
                                              Color.fromARGB(255, 191, 90, 242),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => model.setChooseVal('USDT'),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: const Color.fromRGBO(28, 28, 30, 1),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: model.chosenValue == 'USDT'
                                          ? const Color.fromARGB(
                                              255, 191, 90, 242)
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 45,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'USDT',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Visibility(
                                        visible: model.chosenValue == "USDT"
                                            ? true
                                            : false,
                                        child: const Icon(
                                          Icons.done,
                                          color:
                                              Color.fromARGB(255, 191, 90, 242),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => model.setChooseVal('ADA'),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: const Color.fromRGBO(28, 28, 30, 1),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: model.chosenValue == 'ADA'
                                          ? const Color.fromARGB(
                                              255, 191, 90, 242)
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 45,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'ADA',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Visibility(
                                        visible: model.chosenValue == "ADA"
                                            ? true
                                            : false,
                                        child: const Icon(
                                          Icons.done,
                                          color:
                                              Color.fromARGB(255, 191, 90, 242),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            verticalSpaceSmall,
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenWidth(context) / 2.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Bonus Calculation',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            verticalSpaceRegular,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Prebonus token :',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  model.prebonusToken.toStringAsFixed(2),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            verticalSpaceSmall,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Bonus token :',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '+ ${model.percentageToken.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            verticalSpaceSmall,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'total :',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  model.totalToken.toStringAsFixed(2),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         model.setChooseVal('BTC');
                  //       },
                  //       child: Container(
                  //         width: 170,
                  //         decoration: BoxDecoration(
                  //           border: Border.all(
                  //             color: model.chosenValue == 'BTC'
                  //                 ? const Color.fromARGB(255, 191, 90, 242)
                  //                 : Colors.grey,
                  //             width: 1,
                  //           ),
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //         padding: const EdgeInsets.all(20),
                  //         child: Column(
                  //           children: [
                  //             const Text(
                  //               'BTC',
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 24,
                  //               ),
                  //             ),
                  //             verticalSpaceRegular,
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: const [
                  //                 Text(
                  //                   '0.00013',
                  //                   style: TextStyle(
                  //                     fontSize: 20,
                  //                     color: Colors.green,
                  //                   ),
                  //                 ),
                  //                 horizontalSpaceSmall,
                  //                 Icon(
                  //                   Icons.arrow_upward,
                  //                   color: Colors.green,
                  //                   size: 16,
                  //                 ),
                  //                 Text(
                  //                   '23%',
                  //                   style: TextStyle(
                  //                     fontSize: 12,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {
                  //         model.setChooseVal('ETH');
                  //       },
                  //       child: Container(
                  //         width: 170,
                  //         decoration: BoxDecoration(
                  //           border: Border.all(
                  //             color: model.chosenValue == 'ETH'
                  //                 ? const Color.fromARGB(255, 191, 90, 242)
                  //                 : Colors.grey,
                  //             width: 1,
                  //           ),
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //         padding: const EdgeInsets.all(20),
                  //         child: Column(
                  //           children: [
                  //             const Text(
                  //               'ETH',
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 24,
                  //               ),
                  //             ),
                  //             verticalSpaceRegular,
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: const [
                  //                 Text(
                  //                   '0.00003',
                  //                   style: TextStyle(
                  //                     fontSize: 20,
                  //                     color: Colors.red,
                  //                   ),
                  //                 ),
                  //                 horizontalSpaceSmall,
                  //                 Icon(
                  //                   Icons.arrow_downward,
                  //                   color: Colors.red,
                  //                   size: 16,
                  //                 ),
                  //                 Text(
                  //                   '13%',
                  //                   style: TextStyle(
                  //                     fontSize: 12,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // verticalSpaceRegular,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         model.setChooseVal('USDT');
                  //       },
                  //       child: Container(
                  //         width: 170,
                  //         decoration: BoxDecoration(
                  //           border: Border.all(
                  //             color: model.chosenValue == 'USDT'
                  //                 ? const Color.fromARGB(255, 191, 90, 242)
                  //                 : Colors.grey,
                  //             width: 1,
                  //           ),
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //         padding: const EdgeInsets.all(20),
                  //         child: Column(
                  //           children: [
                  //             const Text(
                  //               'USDT',
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 24,
                  //               ),
                  //             ),
                  //             verticalSpaceRegular,
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: const [
                  //                 Text(
                  //                   '0.013',
                  //                   style: TextStyle(
                  //                     fontSize: 20,
                  //                     color: Colors.red,
                  //                   ),
                  //                 ),
                  //                 horizontalSpaceSmall,
                  //                 Icon(
                  //                   Icons.arrow_downward,
                  //                   color: Colors.red,
                  //                   size: 16,
                  //                 ),
                  //                 Text(
                  //                   '3%',
                  //                   style: TextStyle(
                  //                     fontSize: 12,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {
                  //         model.setChooseVal('INR');
                  //       },
                  //       child: Container(
                  //         width: 170,
                  //         decoration: BoxDecoration(
                  //           border: Border.all(
                  //             color: model.chosenValue == 'INR'
                  //                 ? const Color.fromARGB(255, 191, 90, 242)
                  //                 : Colors.grey,
                  //             width: 1,
                  //           ),
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //         padding: const EdgeInsets.all(20),
                  //         child: Column(
                  //           children: [
                  //             const Text(
                  //               'INR',
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 24,
                  //               ),
                  //             ),
                  //             verticalSpaceRegular,
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: const [
                  //                 Text(
                  //                   '0.0125',
                  //                   style: TextStyle(
                  //                     fontSize: 20,
                  //                     color: Colors.green,
                  //                   ),
                  //                 ),
                  //                 horizontalSpaceSmall,
                  //                 Icon(
                  //                   Icons.arrow_upward,
                  //                   color: Colors.green,
                  //                   size: 16,
                  //                 ),
                  //                 Text(
                  //                   '4%',
                  //                   style: TextStyle(
                  //                     fontSize: 12,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // verticalSpaceMedium,
                  // Card(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(20.0),
                  //   ),
                  //   color: const Color.fromRGBO(28, 28, 30, 1),
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: 20,
                  //       vertical: 10,
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //       children: [
                  //         Container(
                  //           padding: const EdgeInsets.symmetric(
                  //             horizontal: 10,
                  //             vertical: 5,
                  //           ),
                  //           width: 120,
                  //           child: TextFormField(
                  //             controller: model.covertedEditingController,
                  //             style: const TextStyle(
                  //               color: Colors.white,
                  //             ),
                  //             keyboardType: TextInputType.number,
                  //             decoration: const InputDecoration(
                  //               focusedBorder: OutlineInputBorder(
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(5.0)),
                  //                 borderSide: BorderSide(
                  //                   color: Color.fromARGB(255, 191, 90, 242),
                  //                 ),
                  //               ),
                  //               labelStyle: TextStyle(
                  //                 color: Colors.white,
                  //                 letterSpacing: 1,
                  //               ),
                  //               label: Text('USD'),
                  //             ),
                  //           ),
                  //         ),
                  //         const Icon(
                  //           Icons.compare_arrows,
                  //           color: Colors.white,
                  //         ),
                  //         Container(
                  //           padding: const EdgeInsets.symmetric(
                  //             horizontal: 10,
                  //             vertical: 5,
                  //           ),
                  //           width: 120,
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               const Text(
                  //                 'Fiti5 tokens',
                  //                 style: TextStyle(
                  //                   color: Colors.white,
                  //                   letterSpacing: 1,
                  //                 ),
                  //               ),
                  //               verticalSpaceSmall,
                  //               Text(
                  //                 model.fiti5EditingController.text.toString(),
                  //                 style: const TextStyle(
                  //                   color: Colors.white,
                  //                   fontSize: 18,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           // TextFormField(
                  //           //   controller: model.fiti5EditingController,
                  //           //   style: const TextStyle(
                  //           //     color: Colors.white,
                  //           //   ),
                  //           //   keyboardType: TextInputType.number,
                  //           //   decoration: const InputDecoration(
                  //           //     focusedBorder: OutlineInputBorder(
                  //           //       borderRadius:
                  //           //           BorderRadius.all(Radius.circular(5.0)),
                  //           //       borderSide: BorderSide(
                  //           //         color: Color.fromARGB(255, 191, 90, 242),
                  //           //       ),
                  //           //     ),
                  //           //     labelStyle: TextStyle(
                  //           //       color: Colors.white,
                  //           //       letterSpacing: 1,
                  //           //     ),
                  //           //     label: Text('FITI5 Tokens'),
                  //           //   ),
                  //           // ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(20.0),
                  //   ),
                  //   color: const Color.fromRGBO(28, 28, 30, 1),
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         padding: const EdgeInsets.symmetric(
                  //           horizontal: 20,
                  //           vertical: 10,
                  //         ),
                  //         child: const Text(
                  //           '* dollar 100 minimum contribution requires!',
                  //           style: TextStyle(
                  //             color: Colors.red,
                  //             fontSize: 12,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // verticalSpaceMedium,
                  verticalSpaceRegular,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => model.setToken(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color.fromARGB(255, 94, 92, 230),
                              width: 1,
                            ),
                          ),
                          child: const Text(
                            '10%',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => model.setToken(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color.fromARGB(255, 94, 92, 230),
                              width: 1,
                            ),
                          ),
                          child: const Text(
                            '20%',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => model.setToken(40),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color.fromARGB(255, 94, 92, 230),
                              width: 1,
                            ),
                          ),
                          child: const Text(
                            '40%',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => model.setToken(60),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color.fromARGB(255, 94, 92, 230),
                              width: 1,
                            ),
                          ),
                          child: const Text(
                            '60%',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => model.setToken(80),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color.fromARGB(255, 94, 92, 230),
                              width: 1,
                            ),
                          ),
                          child: const Text(
                            '80%',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => model.setToken(100),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color.fromARGB(255, 94, 92, 230),
                              width: 1,
                            ),
                          ),
                          child: const Text(
                            '100%',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
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
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: model.fiti5EditingController,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 191, 90, 242),
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1,
                              ),
                              label: Text('Enter the No. of USDT Tokens'),
                            ),
                          ),
                          verticalSpaceSmall,
                          const Text(
                            '* dollar 100 minimum contribution requires!',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                  GestureDetector(
                    onTap: () => model.onButtonClick(context),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 60),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 191, 90, 242),
                            Color.fromARGB(255, 94, 92, 230),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Buy',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceLarge,
                ],
              ),
            ),
          ),
        ),
      ),
      onDispose: (model) {
        model.disposeListener();
      },
      viewModelBuilder: () => BuySellViewModel(),
    );
  }
}
