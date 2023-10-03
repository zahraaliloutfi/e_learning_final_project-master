import 'package:e_learning_final_project/view/global/utill/images.dart';
import 'package:e_learning_final_project/view/screens/auth/auth_pages/sign_up_screen.dart';
import 'package:e_learning_final_project/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../global/utill/colors.dart';




class InternetNotFoundScreen extends StatelessWidget {
  const InternetNotFoundScreen({super.key,required this.isTeasher,required this.isGuest});
  final bool isTeasher;
  final bool isGuest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/image-removebg-preview (12).png',
            scale: 1,
          ),
          // SizedBox(
          //   height: 40,
          // ),
          Text(
            'Sorry!!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'No Internet Connection ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              // fontWeight: FontWeight.w200,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // Container(
          //   width: double.infinity,
          //   child: TextButton(
          //     onPressed: () {
          //       Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => SignUpPage(),
          //           ));
          //     },
          //     child: const Padding(
          //       padding: EdgeInsets.all(10),
          //       child: Text(
          //         'Try again',
          //         style: TextStyle(color: Colors.white, fontSize: 17),
          //       ),
          //     ),
          //     style: ButtonStyle(
          //       backgroundColor: MaterialStateProperty.all<Color>(
          //           ColorResources.kPrimaryColorBlue),
          //     ),
          //   ),
          // )

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              text: 'Try again',
              outColor: ColorResources.kPrimaryColor,
              height: 50,
              backGroundColor: ColorResources.kPrimaryColorBlue,
              textColor: ColorResources.kPrimaryColorWhite,
              fontSize: 19,
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpPage(
                    isGuest: isGuest,
                    isTeasher: isTeasher,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
