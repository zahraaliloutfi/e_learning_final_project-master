import 'package:e_learning_final_project/view/global/utill/custom_fonts.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import '../global/utill/colors.dart';

class OnBoardingContainer extends StatefulWidget {
  OnBoardingContainer({super.key,
    this.image,
    this.text1,
    this.text2,
    this.text3,
    this.text5,
    this.text4,
   required this.page,
    this.index,
    this.onPressed,

    required this.customButton1,
    required this.customButton2});

  String? image;
  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;
  final bool page ;
  final String? text5;
  Widget customButton1;
  Widget customButton2;
  final int? index;
  VoidCallback? onPressed;

  @override
  State<OnBoardingContainer> createState() => _OnBoardingContainerState();
}

class _OnBoardingContainerState extends State<OnBoardingContainer> {
  LiquidController? controller = LiquidController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: ColorResources.kPrimaryColorWhite,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: widget.onPressed,
                      child: Text(
                        'Skip',
                        style: TajawalMedium.copyWith(
                            color: ColorResources.kPrimaryColorGrey),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        widget.page ? Navigator.pop(context) : null;
                        setState(() {
                        });
                      },
                      icon: Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Image.asset(
                widget.image!,
                height: size.height * 0.5,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(widget.text1!,
                      textAlign: TextAlign.center,
                      style: TajwalRegular.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: ColorResources.gettextcolor(context),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      widget.text2!,
                      textAlign: TextAlign.center,
                      style: TajwalRegular.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: ColorResources.gettextcolor(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      widget.text3!,
                      textAlign: TextAlign.center,
                      style: TajwalRegular.copyWith(
                        fontSize: 20,
                        color: ColorResources.kPrimaryColorGrey,
                      ),
                    ),
                  ),
                  Text(
                    widget.text4!,
                    textAlign: TextAlign.center,
                    style: TajwalRegular.copyWith(
                      fontSize: 20,
                      color: ColorResources.kPrimaryColorGrey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.text5!,
                    textAlign: TextAlign.center,
                    style: TajwalRegular.copyWith(
                      fontSize: 20,
                      color: ColorResources.kPrimaryColorGrey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(child: widget.customButton1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(child: widget.customButton2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
