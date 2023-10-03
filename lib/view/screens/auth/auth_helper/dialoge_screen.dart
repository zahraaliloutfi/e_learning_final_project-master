import 'package:e_learning_final_project/view/global/utill/colors.dart';

import 'package:e_learning_final_project/view/screens/navigation/navigation.dart';

import 'package:e_learning_final_project/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../navigation/MainNavigation.dart';

class DialogScreen extends StatelessWidget {
  DialogScreen({
    Key? key,
    this.icon,
    this.text1,
    this.text2,
    this.text2Size = 17,
    this.buttonText,
    this.text1Size = 25,
    required this.isGuest,
    required this.isTeasher,
  }) : super(key: key);
  final bool isTeasher;
  final bool isGuest;
  final IconData? icon;
  final String? text1;
  final String? text2;
  final double? text2Size;
  final double? text1Size;

  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: AlertDialog(
            actions: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: ColorResources.kPrimaryColorBlue,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              icon,
                              color: ColorResources.kPrimaryColorWhite,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      text1!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: text1Size),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              text2!,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: ColorResources.kPrimaryColorGrey,
                                  fontSize: text2Size),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  text: buttonText,
                  outColor: ColorResources.kPrimaryColor,
                  height: 50,
                  backGroundColor: ColorResources.kPrimaryColorBlue,
                  textColor: ColorResources.kPrimaryColorWhite,
                  fontSize: 19,
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavBarV2(),
                          // NavigationScreen(
                          // isGuest: isGuest, isTeasher: isTeasher),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
