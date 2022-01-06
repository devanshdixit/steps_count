import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:steps_count/ui/shared/ui_helpers.dart';
import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: const Color.fromRGBO(28, 28, 30, 1),
            title: const Text('Login'),
          ),
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpaceRegular,
                    SizedBox(
                      height: 250,
                      child: Lottie.network(
                        'https://assets2.lottiefiles.com/packages/lf20_oncjxjbd.json',
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              verticalSpaceSmall,
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please a Enter your Email';
                                  }
                                  if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(value)) {
                                    return 'Please a valid Email';
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  suffix: SizedBox(
                                    width: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [
                                        Icon(
                                          Icons.email,
                                          color: Colors.white,
                                        ),
                                        horizontalSpaceSmall,
                                      ],
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 191, 90, 242),
                                      width: 1.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 191, 90, 242),
                                      width: 2,
                                    ),
                                  ),
                                  labelStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                  label: SizedBox(
                                    width: 210,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Icon(
                                          Icons.email_outlined,
                                          color: Colors.white,
                                        ),
                                        horizontalSpaceRegular,
                                        Text('Enter your email id'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              verticalSpaceRegular,
                              TextFormField(
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please a Enter Password';
                                  } else if (value.length <= 8) {
                                    return 'Minimum 8 character required';
                                  }
                                  return null;
                                },
                                obscureText: model.passenable,
                                onFieldSubmitted: (value) {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Processing Data'),
                                      ),
                                    );
                                    model.login(
                                      emailController.text,
                                      passwordController.text,
                                      context,
                                    );
                                  }
                                },
                                controller: passwordController,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  suffix: SizedBox(
                                    width: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            print(model.passenable);
                                            if (model.passenable) {
                                              model.setPassEnable(false);
                                            } else {
                                              model.setPassEnable(true);
                                            }
                                          },
                                          child: Icon(
                                            model.passenable
                                                ? Icons.remove_red_eye
                                                : Icons.password,
                                            color: Colors.white,
                                          ),
                                        ),
                                        horizontalSpaceSmall,
                                      ],
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 191, 90, 242),
                                      width: 1.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 191, 90, 242),
                                      width: 2,
                                    ),
                                  ),
                                  labelStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                  label: SizedBox(
                                    width: 210,
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.lock_outlined,
                                          color: Colors.white,
                                        ),
                                        horizontalSpaceRegular,
                                        Text('Enter your password'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              verticalSpaceSmall,
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'forgot password?',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.amberAccent.shade200,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    verticalSpaceSmall,
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          model.login(
                            emailController.text,
                            passwordController.text,
                            context,
                          );
                        }
                      },
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 60),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
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
                        child: Center(
                          child: model.isBusy
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    verticalSpaceRegular,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Dont have a Account?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.amberAccent.shade200,
                            ),
                          ),
                          TextButton(
                            onPressed: () => model.navigateToCreateAccount(),
                            child: Text(
                              'SignUp',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.amberAccent.shade200,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    verticalSpaceLarge,
                  ],
                ),
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
