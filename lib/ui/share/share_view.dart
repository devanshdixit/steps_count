import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steps_count/ui/share/share_viewmodel.dart';
import 'package:steps_count/ui/shared/constants.dart';
import 'package:steps_count/ui/shared/ui_helpers.dart';

class ShareView extends StatelessWidget {
  const ShareView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShareViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: 60,
          leading: Row(
            children: [
              horizontalSpaceSmall,
              InkWell(
                onTap: () => model.navigateBack(),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(28, 28, 30, 1),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpaceTiny,
              // Row(
              //   children: [
              //     horizontalSpaceSmall,
              //     InkWell(
              //       onTap: () => model.navigateBack(),
              //       child: Container(
              //         height: 50,
              //         width: 50,
              //         decoration: BoxDecoration(
              //           color: const Color.fromRGBO(28, 28, 30, 1),
              //           borderRadius: BorderRadius.circular(40),
              //         ),
              //         child: Icon(
              //           Icons.arrow_back_ios_new,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: const Color.fromRGBO(28, 28, 30, 1),
                child: Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Center(
                    child: Text(
                      'image',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpaceMedium,
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
                  child: Text(
                    'https://medium.com/codechai/flutter-7-bottom-navigation-with-floating-button-9190648372fd',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              verticalSpaceRegular,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 191, 90, 242),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Image.asset(Assets.fb),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 191, 90, 242),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Image.asset(Assets.insta),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 191, 90, 242),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Image.asset(Assets.messenger),
                  ),
                ],
              ),
              verticalSpaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 191, 90, 242),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Image.asset(Assets.reddit),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 191, 90, 242),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Image.asset(Assets.whatsapp),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 191, 90, 242),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Image.asset(Assets.yt),
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
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 191, 90, 242),
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      label: Text('Enter the link of shared post'),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  model.navigateBack();
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: const Color.fromRGBO(28, 28, 30, 1),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
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
      viewModelBuilder: () => ShareViewModel(),
    );
  }
}
