import 'package:e_learning_final_project/view/global/utill/images.dart';
import 'package:e_learning_final_project/view/screens/auth/auth_pages/auth_phone.dart';
import 'package:e_learning_final_project/view/screens/auth/auth_pages/sign_up_screen.dart';
import 'package:e_learning_final_project/view/screens/home/home.dart';
import 'package:e_learning_final_project/view/screens/navigation/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../global/utill/colors.dart';
import '../../navigation/MainNavigation.dart';
import '../auth_helper/show_snack_bar.dart';
import '../validation_logic.dart/facebook_login.dart';
import '../validation_logic.dart/google_login_in.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_gesture _detector.dart';
import '../../../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.isGuest, required this.isTeasher});

  final bool isTeasher;
  final bool isGuest;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final currentUser = FirebaseAuth.instance.currentUser;

  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  bool _isObscure = true;
  String? email;
  String? password;
  bool isLoadin = true;

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  // GoogleLogIn google = GoogleLogIn();
  // FacebookLogIn facebook = FacebookLogIn();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                builder: (context) => SignUpPage(
                    isTeasher: widget.isTeasher, isGuest: widget.isGuest),
              ),
            ),
          ),
        ),
        backgroundColor: ColorResources.kPrimaryColor,
        body: Column(
          children: [
            Container(
              alignment: AlignmentDirectional.bottomStart,
              color: ColorResources.kPrimaryColor,
              height: 80,
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ModalProgressHUD(
                      inAsyncCall: isLoading,
                      child: Form(
                        key: formKey,
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 20,
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
                              height: 30,
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
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: ColorResources.kPrimaryColorblack,
                                  ),
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
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Forget password?',
                                  style: TextStyle(
                                    color: ColorResources.kPrimaryColorGrey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              outColor: ColorResources.kPrimaryColorBlue,
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  isLoading = true;
                                  setState(() {});
                                  try {
                                    await loginUser();
                                    showSnackBar(context, 'Success');
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        //     NavigationScreen(
                                        //   name:
                                        //       currentUser?.email?.split('@')[0],
                                        //   isGuest: widget.isGuest,
                                        //   isTeasher: widget.isTeasher,
                                        // ),
                                        const BottomNavBarV2()
                                      ),
                                    );
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      print('No user found for that email.');
                                      showSnackBar(context,
                                          'No user found for that email.');
                                    } else if (e.code == 'wrong-password') {
                                      print(
                                          'Wrong password provided for that user.');
                                      showSnackBar(context,
                                          'Wrong password provided for that user.');
                                    }
                                  } catch (e) {
                                    print(e);
                                    showSnackBar(
                                        context, 'errorrrrrrrrrrrrrrrrr');
                                  }
                                  isLoading = false;
                                  setState(() {});
                                } else {
                                  // showSnackBar(context, 'not found');
                                }
                              },
                              backGroundColor: ColorResources.kPrimaryColorBlue,
                              fontSize: 19,
                              height: 50,
                              textColor: ColorResources.kPrimaryColorWhite,
                              text: 'Log In',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'dont have an account?',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: ColorResources.kPrimaryColorGrey,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    try {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignUpPage(
                                              isGuest: widget.isGuest,
                                              isTeasher: widget.isTeasher),
                                        ),
                                      );
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: ColorResources.kPrimaryColorBlue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    width: 100,
                                    color: ColorResources.kPrimaryColorGrey,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Or login with',
                                  style: TextStyle(
                                      color: ColorResources.kPrimaryColorGrey),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    width: 100,
                                    color: ColorResources.kPrimaryColorGrey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomGestureDetectoreButton(
                                  isLoadin: isLoadin,
                                  onTap: () => () async {
                                    try {
                                      await const GoogleLogIn()
                                          .signInWithGoogle();

                                      print('success');
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  // NavigationScreen(
                                                  //     name: currentUser?.email
                                                  //         ?.split('@')[0],
                                                  //     isGuest: widget.isGuest,
                                                  //     isTeasher:
                                                  //         widget.isTeasher)
                                              BottomNavBarV2(),
                                          ));
                                    } catch (e) {
                                      print('errrrrrrrrrrrrrrrrrror is $e');
                                    }
                                    // setState(() {
                                    //   isLoadin = false;
                                    // });
                                  },
                                  child: const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        AssetsManager.authGoogleImage),
                                    radius: 25.0,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                CustomGestureDetectoreButton(
                                    onTap: () => () async {
                                          try {
                                            await const FacebookLogIn()
                                                .signInWithFacebook();

                                            print('success');
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        // NavigationScreen(
                                                        //     name: currentUser
                                                        //         ?.email
                                                        //         ?.split('@')[0],
                                                        //     isGuest:
                                                        //         widget.isGuest,
                                                        //     isTeasher: widget
                                                        //         .isTeasher)
                                                    BottomNavBarV2()
                                                ));
                                          } catch (e) {
                                            print(
                                                'errrrrrrrrrrrrrrrrrror is $e');
                                          }
                                          // setState(() {
                                          //   isLoadin = false;
                                          // });
                                        },
                                    isLoadin: isLoadin,
                                    child: const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          AssetsManager.authFacebookImage),
                                      radius: 20.0,
                                    )),
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
    );
  }

  Future<void> loginUser() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}

//GestureDetector(
//   onTap: () {
//     Navigator.push(context, MaterialPageRoute(
//       builder: (context) {
//         return RegisterPage();
//       },
//     ));
//   },
//   child: Text(
//     'Register',
//     style: TextStyle(
//       fontSize: 13,
//       color: Colors.white,
//     ),
//   ),
// ),
//  in class(register) ==>>>>> String id = 'RegisterPage';
//Navigator.pushNamed(context, RegisterPage().id);
