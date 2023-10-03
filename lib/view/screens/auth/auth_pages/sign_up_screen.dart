import 'package:e_learning_final_project/view/screens/navigation/navigation.dart';
import 'package:e_learning_final_project/view/screens/onboarding_pages.dart/on_boarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../global/utill/colors.dart';
import '../../navigation/MainNavigation.dart';
import '../auth_helper/show_snack_bar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import 'login_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.isGuest, required this.isTeasher});

  final bool isTeasher;
  final bool isGuest;
  static String id = 'SignUpPage';

  // final bool isTeasher;
  // final bool isGuest;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

GlobalKey<FormState> formKey = GlobalKey();

class _SignUpPageState extends State<SignUpPage> {
  final currentUser = FirebaseAuth.instance.currentUser;
  String? email;
  bool _isObscure = true;
  int _currentStep = 0;
  bool _isObscureIcon = true;
  String? password;
  bool isLoading = false;
  String namee = 'user';

  List<bool> _stepCompleted = [false, false, false];

  void _nextStep() {
    setState(() {
      if (_currentStep < 2) {
        _currentStep += 1;
      }
    });
  }

  void _prevStep() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorResources.kPrimaryColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>  OnBoardingScreen(),
                ),
              ),
            ),
          ),
          backgroundColor: ColorResources.kPrimaryColor,
          body: Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                color: ColorResources.kPrimaryColor,
                height: 80,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        // textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        ' Enter your details below & free sign up',
                        style: TextStyle(
                          fontSize: 10,
                          color: ColorResources.kPrimaryColorGrey,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorResources.kPrimaryColorWhite,
                      borderRadius: BorderRadius.circular(17)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                physics: const NeverScrollableScrollPhysics(),
                                child: Column(
                                  children: [
                                    Stepper(
                                      currentStep: _currentStep,
                                      onStepContinue: () {
                                        setState(() {
                                          if (_currentStep < 2) {
                                            _currentStep++;
                                          }
                                        });
                                      },
                                      onStepCancel: () {
                                        setState(() {
                                          if (_currentStep > 0) {
                                            _currentStep--;
                                          }
                                        });
                                      },
                                      // currentStep: _currentStep,
                                      // onStepContinue: _nextStep,
                                      // onStepCancel: _prevStep,
                                      controlsBuilder: (context, details) {
                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                TextButton(
                                                  onPressed: _prevStep,
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty.all<
                                                                Color>(
                                                            ColorResources
                                                                .kPrimaryColorBlue),
                                                  ),
                                                  child: Text(
                                                    'previous',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: _nextStep,
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty.all<
                                                                Color>(
                                                            ColorResources
                                                                .kPrimaryColorBlue),
                                                  ),
                                                  child: Text(
                                                    'Next',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                      steps: [
                                        Step(
                                            isActive: _currentStep == 0,
                                            state: _stepCompleted[0]
                                                ? StepState.complete
                                                : StepState.indexed,
                                            title: Text('Step 1'),
                                            content: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Your Name',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: ColorResources
                                                        .kPrimaryColorGrey,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                CustomTextFormField(
                                                  obscureText: false,
                                                  hintText: 'Name',
                                                  onChanged: (String data) {
                                                    namee = data;
                                                    print(namee);
                                                  },
                                                ),
                                              ],
                                            )),
                                        Step(
                                          isActive: _currentStep == 1,
                                          state: _stepCompleted[1]
                                              ? StepState.complete
                                              : StepState.indexed,
                                          title: Text('Step 2'),
                                          content: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Your email',
                                                style: TextStyle(
                                                  color: ColorResources
                                                      .kPrimaryColorGrey,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              CustomTextFormField(
                                                obscureText: false,
                                                onChanged: (String data) {
                                                  email = data;
                                                },
                                                hintText: 'Email',
                                              ),
                                            ],
                                          ),
                                        ),
                                        Step(
                                          isActive: _currentStep == 2,
                                          state: _stepCompleted[2]
                                              ? StepState.complete
                                              : StepState.indexed,
                                          title: Text('Step 3'),
                                          content: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'password',
                                                style: TextStyle(
                                                    color: ColorResources
                                                        .kPrimaryColorGrey),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              CustomTextFormField(
                                                obscureText: _isObscure,
                                                suffix: IconButton(
                                                    icon: Icon(_isObscure
                                                        ? Icons.visibility
                                                        : Icons.visibility_off),
                                                    onPressed: () {
                                                      setState(() {
                                                        _isObscure =
                                                            !_isObscure;
                                                      });
                                                    }),
                                                onChanged: (data) {
                                                  password = data;
                                                },
                                                hintText: 'Password',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              CustomButton(
                                backGroundColor:
                                    ColorResources.kPrimaryColorBlue,
                                height: 50,
                                fontSize: 19,
                                textColor: ColorResources.kPrimaryColorWhite,
                                outColor: ColorResources.kPrimaryColorBlue,
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    isLoading = true;
                                    setState(() {});
                                    try {
                                      UserCredential user = await FirebaseAuth
                                          .instance
                                          .createUserWithEmailAndPassword(
                                        email: email!,
                                        password: password!,
                                      );

                                      showSnackBar(context, 'Success');
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                          //     NavigationScreen(
                                          //   name: namee,
                                          //   isTeasher: widget.isTeasher,
                                          //   isGuest: widget.isGuest,
                                          // ),
                                          BottomNavBarV2(),
                                        ),
                                      );
                                      // NavigationScreen(name: namee)
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'weak-password') {
                                        showSnackBar(context, 'weak password');
                                      } else if (e.code ==
                                          'email-already-in-use') {
                                        showSnackBar(
                                            context, 'email is already exsist');
                                      }
                                    } catch (e) {
                                      showSnackBar(
                                          context, 'errorrrrrrrrrrrrrrrrr');
                                    }
                                    isLoading = false;
                                    setState(() {});
                                  } else {}
                                },
                                text: 'Sign Up',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        _isObscureIcon
                                            ? Icons.check_box
                                            : Icons.check_box_outline_blank,
                                        color: ColorResources.kPrimaryColorGrey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscureIcon = !_isObscureIcon;
                                        });
                                      }),
                                  const Text(
                                    """By creating an account you have to agree
      with our them & condication.""",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: ColorResources.kPrimaryColorGrey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'don\'t have an account ? ',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: ColorResources.kPrimaryColorGrey,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginPage(
                                              isTeasher: widget.isTeasher,
                                              isGuest: widget.isGuest),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'log in',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: ColorResources.kPrimaryColorBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
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
    );
  }

  Step customStep({
    required Widget title,
    required Widget content,
    bool isActive = false,
    StepState state = StepState.indexed,
  }) {
    return Step(
      title: title,
      content: content,
      isActive: isActive,
      state: state,
    );
  }
//   Future<void> registerUser() async {}
}

/*

*/

/*

ListView(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Your Name',
                              style: TextStyle(
                                color: ColorResources.kPrimaryColorGrey,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              obscureText: false,
                              hintText: 'Name',
                              onChanged: (String data) {
                                namee = data;
                                print(namee);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Your email',
                              style: TextStyle(
                                color: ColorResources.kPrimaryColorGrey,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              obscureText: false,
                              onChanged: (String data) {
                                email = data;
                              },
                              hintText: 'Email',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'password',
                              style: TextStyle(
                                  color: ColorResources.kPrimaryColorGrey),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              obscureText: _isObscure,
                              suffix: IconButton(
                                  icon: Icon(_isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  }),
                              onChanged: (data) {
                                password = data;
                              },
                              hintText: 'Password',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              backGroundColor: ColorResources.kPrimaryColorBlue,
                              height: 50,
                              fontSize: 19,
                              textColor: ColorResources.kPrimaryColorWhite,
                              outColor: ColorResources.kPrimaryColorBlue,
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  isLoading = true;
                                  setState(() {});
                                  try {
                                    UserCredential user = await FirebaseAuth
                                        .instance
                                        .createUserWithEmailAndPassword(
                                      email: email!,
                                      password: password!,
                                    );

                                    showSnackBar(context, 'Success');
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChatScreen(),
                                      ),
                                    );
                                    // NavigationScreen(name: namee)
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      showSnackBar(context, 'weak password');
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      showSnackBar(
                                          context, 'email is already exsist');
                                    }
                                  } catch (e) {
                                    showSnackBar(
                                        context, 'errorrrrrrrrrrrrrrrrr');
                                  }
                                  isLoading = false;
                                  setState(() {});
                                } else {}
                              },
                              text: 'Sign Up',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      _isObscureIcon
                                          ? Icons.check_box
                                          : Icons.check_box_outline_blank,
                                      color: ColorResources.kPrimaryColorGrey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscureIcon = !_isObscureIcon;
                                      });
                                    }),
                                const Text(
                                  """By creating an account you have to agree
      with our them & condication.""",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: ColorResources.kPrimaryColorGrey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'don\'t have an account ? ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: ColorResources.kPrimaryColorGrey,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'log in',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: ColorResources.kPrimaryColorBlue,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),


*/
