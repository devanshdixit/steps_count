import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steps_count/ui/profile/profile_viewmodel.dart';
import 'package:steps_count/ui/shared/ui_helpers.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceRegular,
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 100),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: const Color.fromRGBO(28, 28, 30, 1),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpaceLarge,
                                    verticalSpaceSmall,
                                    Text(
                                      'Jullieta Johnson',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 22,
                                      ),
                                    ),
                                    verticalSpaceSmall,
                                    Text(
                                      'jullietajohnson@gmail.com',
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 15,
                                      ),
                                    ),
                                    verticalSpaceRegular,
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 110,
                        right: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade700,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth(context) / 3.2,
                        top: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade700,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          width: 120,
                          height: 120,
                          padding: EdgeInsets.all(10),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(
                                'https://www.mensjournal.com/wp-content/uploads/mf/1280-selfie.jpg?w=900&quality=86&strip=all'),
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
      ),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
