//Make an onboarding screen open for the first time only by calling it in main
import 'package:e_learning_final_project/view/screens/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../navigation/MainNavigation.dart';
import 'on_boarding_screen.dart';

class FtOnBoarding extends StatefulWidget {
  const FtOnBoarding(
      {super.key,});



  @override
  State<FtOnBoarding> createState() => _FtOnBoardingState();
}

class _FtOnBoardingState extends State<FtOnBoarding>
    with AfterLayoutMixin<FtOnBoarding> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);
    if (seen) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const BottomNavBarV2()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(

              )));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
