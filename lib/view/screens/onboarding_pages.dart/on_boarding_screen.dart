import 'package:e_learning_final_project/view/global/utill/images.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../global/utill/colors.dart';
import '../auth/auth_pages/login_screen.dart';
import '../auth/auth_pages/sign_up_screen.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custum_on_bourding_container.dart';
import 'onboarding4.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;

  final controller = LiquidController();

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      OnBoardingContainer(
          customButton1: Container(),
          customButton2: Container(),
          page: false,
          image: AssetsManager.onBoardingimage1,
          text1: 'Numerous free',
          text2: 'trial courses',
          text3: 'Free courses for you to',
          text4: 'find your way to learning',
          text5: '',
          index: 1,
          onPressed: () {
            int nextPage = controller.currentPage + 1;
            controller.animateToPage(page: nextPage);
          }),
      OnBoardingContainer(
        customButton1: Container(),
        page: false,
        customButton2: Container(),
        image: AssetsManager.onBoardingimage2,
        text1: 'Quick and easy ',
        text2: 'learning',
        text3: 'Easy and fast learning at',
        text4: 'any time to help you ',
        text5: 'improve various skills',
        index: 2,
        onPressed: () => controller.jumpToPage(page: 2),
      ),
       OnBoarding3(),
    ];
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            LiquidSwipe(
              onPageChangeCallback: OnPageChangeCallback,
              pages: pages,
              liquidController: controller,
              enableLoop: false,
              enableSideReveal: false,
              // slideIconWidget: Icon(Icons.arrow_back_ios),
              // enableSideReveal: true,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedSmoothIndicator(
                      activeIndex: controller.currentPage,
                      count: pages.length,
                      effect: const WormEffect(
                        dotColor: ColorResources.kPrimaryColor,
                        activeDotColor: ColorResources.kPrimaryColorBlue,
                        dotHeight: 5,
                        dotWidth: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  OnPageChangeCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
