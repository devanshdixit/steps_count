import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steps_count/ui/profileediting/profileedit_viewmodel.dart';
import 'package:steps_count/ui/shared/ui_helpers.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({
    Key? key,
    required this.email,
    required this.name,
    required this.telgramId,
    required this.createdAt,
  }) : super(key: key);
  final String name;
  final String email;
  final String telgramId;
  final String createdAt;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileEditViewModel>.reactive(
      onModelReady: (model) {
        model.setListeners(email, name, telgramId);
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color.fromRGBO(28, 28, 30, 1),
          title: Text(
            'Edit Profile',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 24,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceRegular,
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Text(
                        'created at: ',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 12,
                          letterSpacing: 1,
                        ),
                      ),
                      Text(
                        createdAt,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12,
                          letterSpacing: 1.4,
                        ),
                      ),
                    ],
                  ),
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
                      controller: model.emailEditingController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 191, 90, 242),
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        label: Text('Enter your name'),
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
                      vertical: 10,
                    ),
                    child: TextFormField(
                      controller: model.emailEditingController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 191, 90, 242),
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        label: Text('Enter your email'),
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
                      vertical: 10,
                    ),
                    child: TextFormField(
                      controller: model.telegramEditingController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 191, 90, 242),
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        label: Text('Enter your telegram id'),
                      ),
                    ),
                  ),
                ),
                verticalSpaceRegular,
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: const Color.fromRGBO(28, 28, 30, 1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 10,
                        ),
                        child: const Text(
                          'Update',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ProfileEditViewModel(),
    );
  }
}
