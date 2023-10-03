import 'package:e_learning_final_project/view/screens/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../global/utill/colors.dart';
import '../../global/utill/images.dart';
import '../../widgets/custum_on_bourding_container.dart';
import '../auth/auth_pages/login_screen.dart';
import '../auth/auth_pages/sign_up_screen.dart';
import '../../widgets/custom_button.dart';
import '../navigation/MainNavigation.dart';

class OnBoarding3 extends StatefulWidget {
  const OnBoarding3({
    super.key,
  });

  @override
  State<OnBoarding3> createState() => _OnBoarding3State();
}

final controller = LiquidController();

class _OnBoarding3State extends State<OnBoarding3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(AssetsManager.onBoardingimage3),
          ),
          const SizedBox(
            height: 17,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: CustomButton(
                    fontSize: 21,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnBoardingContainer(
                              page: true,
                                customButton1: CustomButton(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignUpPage(
                                            isTeasher: true,
                                            isGuest: false,
                                          ),
                                        ));
                                  },
                                  text: 'Sing Up',
                                  backGroundColor:
                                      ColorResources.kPrimaryColorBlue,
                                  textColor: ColorResources.kPrimaryColorWhite,
                                  height: 50,
                                  width: 150,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  outColor: ColorResources.kPrimaryColorBlue,
                                ),
                                customButton2: CustomButton(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginPage(
                                            isGuest: true,
                                            isTeasher: false,
                                          ),
                                        ));
                                  },
                                  text: 'Log In',
                                  backGroundColor:
                                      ColorResources.kPrimaryColorWhite,
                                  textColor: ColorResources.kPrimaryColorBlue,
                                  height: 50,
                                  width: 150,
                                  outColor: ColorResources.kPrimaryColorBlue,
                                ),
                                image: AssetsManager.onBoardingimage5,
                                text1: 'Create your own ',
                                text2: 'learning study plan',
                                text3: 'Study according to the',
                                text4: 'study plan, make study',
                                text5: 'more motivated',
                                onPressed: () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (conetxt) => const BottomNavBarV2()))),
                          ));
                    },
                    text: 'Teacher',
                    isTeacher: true,
                    backGroundColor: ColorResources.kPrimaryColorBlue,
                    textColor: ColorResources.kPrimaryColorWhite,
                    height: 50,
                    width: 150,
                    outColor: ColorResources.kPrimaryColorBlue,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: CustomButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnBoardingContainer(
                            page: true,
                            customButton1: CustomButton(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpPage(
                                        isTeasher: false,
                                        isGuest: false,
                                      ),
                                    ));
                              },
                              text: 'Sing Up',
                              backGroundColor: ColorResources.kPrimaryColorBlue,
                              textColor: ColorResources.kPrimaryColorWhite,
                              height: 50,
                              width: 150,
                              outColor: ColorResources.kPrimaryColorBlue,
                            ),
                            customButton2: CustomButton(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(
                                        isGuest: false,
                                        isTeasher: false,
                                      ),
                                    ));
                              },
                              text: 'Log In',
                              backGroundColor:
                                  ColorResources.kPrimaryColorWhite,
                              textColor: ColorResources.kPrimaryColorBlue,
                              height: 50,
                              width: 150,
                              outColor: ColorResources.kPrimaryColorBlue,
                            ),
                            image: AssetsManager.onBoardingimage5,
                            text1: 'Create your own ',
                            text2: 'learning study plan',
                            text3: 'Study according to the',
                            text4: 'study plan, make study',
                            text5: 'more motivated',
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BottomNavBarV2())),
                          ),
                        ),
                      );
                    },
                    text: 'Student',
                    isTeacher: false,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    backGroundColor: ColorResources.kPrimaryColorWhite,
                    textColor: ColorResources.kPrimaryColorBlue,
                    width: 150,
                    height: 50,
                    outColor: ColorResources.kPrimaryColorBlue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: CustomButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavBarV2()
                      ));
                },
                text: 'Skip for Now!',
                backGroundColor: ColorResources.kPrimaryColorOrange,
                textColor: ColorResources.kPrimaryColorWhite,
                width: 250,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                height: 50,
                outColor: ColorResources.kPrimaryColorOrange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
