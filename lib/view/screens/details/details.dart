import 'package:e_learning_final_project/view/screens/details/widgets/app_decoration.dart';
import 'package:e_learning_final_project/view/screens/details/widgets/appbar_image.dart';
import 'package:e_learning_final_project/view/screens/details/widgets/appbar_image_1.dart';
import 'package:e_learning_final_project/view/screens/details/widgets/custom_app_bar.dart';
import 'package:e_learning_final_project/view/screens/details/widgets/custom_elevated_button.dart';
import 'package:e_learning_final_project/view/screens/details/widgets/custom_icon_button.dart';
import 'package:e_learning_final_project/view/screens/details/widgets/custom_image_view.dart';
import 'package:e_learning_final_project/view/screens/details/widgets/custom_text_style.dart';
import 'package:e_learning_final_project/view/screens/details/widgets/image_constant.dart';
import 'package:e_learning_final_project/view/screens/details/widgets/size_utils.dart';
import 'package:e_learning_final_project/view/screens/details/widgets/theme_helper.dart';
import 'package:flutter/material.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimary,
            body: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                margin: const EdgeInsets.all(0),
                color: theme.colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusStyle.roundedBorder18),
                child: Container(
                    height: getVerticalSize(647),
                    width: double.maxFinite,
                    decoration: AppDecoration.fillOnPrimary.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder18),
                    child: Stack(alignment: Alignment.topLeft, children: [
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                              height: getVerticalSize(361),
                              width: double.maxFinite,
                              decoration:
                                  BoxDecoration(color: appTheme.red50))),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              height: getVerticalSize(221),
                              width: getHorizontalSize(342),
                              margin: getMargin(top: 23),
                              child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgGroup,
                                        height: getVerticalSize(221),
                                        width: getHorizontalSize(142),
                                        alignment: Alignment.centerRight),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                            height: getVerticalSize(159),
                                            width: getHorizontalSize(158),
                                            margin: getMargin(top: 13),
                                            padding: getPadding(
                                                left: 20,
                                                top: 22,
                                                right: 20,
                                                bottom: 22),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        ImageConstant.imgTag),
                                                    fit: BoxFit.cover)),
                                            child: Stack(
                                                alignment: Alignment.topLeft,
                                                children: [
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgVideocamera,
                                                      height:
                                                          getVerticalSize(26),
                                                      width:
                                                          getHorizontalSize(95),
                                                      alignment:
                                                          Alignment.topLeft),
                                                  Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 10, top: 4),
                                                          child: Text(
                                                              "BESTSELLER",
                                                              style: theme
                                                                  .textTheme
                                                                  .bodySmall)))
                                                ]))),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                            padding:
                                                getPadding(left: 20, top: 76),
                                            child: Text("ProductDesign v1.0",
                                                style: theme
                                                    .textTheme.titleLarge)))
                                  ]))),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              margin: getMargin(left: 19, right: 19),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'ImageConstant.imgDetails'),
                                      fit: BoxFit.cover)),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(top: 1),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text("Product Design v1.0",
                                                        style: theme.textTheme
                                                            .titleLarge),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 1),
                                                        child: Text(
                                                            "6h 14min · 24 Lessons",
                                                            style: CustomTextStyles
                                                                .bodySmallBluegray400))
                                                  ])),
                                          Padding(
                                              padding: getPadding(bottom: 21),
                                              child: Text("74.00",
                                                  style: CustomTextStyles
                                                      .titleLargePrimary))
                                        ]),
                                    Padding(
                                        padding: getPadding(top: 16),
                                        child: Text("About this course",
                                            style:
                                                theme.textTheme.titleMedium)),
                                    Container(
                                        width: getHorizontalSize(308),
                                        margin: getMargin(top: 4, right: 30),
                                        child: Text(
                                            "Sed ut perspiciatis unde omnis iste natus error sit \nvoluptatem accusantium doloremque laudantium, ",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyles
                                                .bodySmallGray500)),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgCut,
                                        height: getSize(16),
                                        width: getSize(16),
                                        alignment: Alignment.center,
                                        margin: getMargin(top: 19)),
                                    Padding(
                                        padding: getPadding(top: 25),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      top: 4, bottom: 5),
                                                  child: Text("01 ",
                                                      style: theme.textTheme
                                                          .headlineSmall)),
                                              Padding(
                                                  padding: getPadding(left: 32),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            "Welcome to the Course",
                                                            style: theme
                                                                .textTheme
                                                                .bodyMedium),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 6),
                                                            child: Row(
                                                                children: [
                                                                  Text("6:10",
                                                                      style: CustomTextStyles
                                                                          .labelLargePrimary),
                                                                  Padding(
                                                                      padding: getPadding(
                                                                          left:
                                                                              8),
                                                                      child: Text(
                                                                          "mins",
                                                                          style:
                                                                              CustomTextStyles.labelLargePrimary)),
                                                                  Container(
                                                                      height:
                                                                          getSize(
                                                                              12),
                                                                      width: getSize(
                                                                          12),
                                                                      padding: getPadding(
                                                                          left:
                                                                              3,
                                                                          top:
                                                                              4,
                                                                          right:
                                                                              3,
                                                                          bottom:
                                                                              4),
                                                                      decoration: AppDecoration
                                                                          .fillPrimary
                                                                          .copyWith(
                                                                              borderRadius: BorderRadiusStyle
                                                                                  .circleBorder6),
                                                                      child: CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVector6,
                                                                          height: getVerticalSize(
                                                                              4),
                                                                          width: getHorizontalSize(
                                                                              6),
                                                                          alignment:
                                                                              Alignment.center))
                                                                ]))
                                                      ])),
                                              Spacer(),
                                              CustomIconButton(
                                                  height: 44,
                                                  width: 44,
                                                  margin: getMargin(bottom: 2),
                                                  padding: getPadding(all: 14),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgPlay))
                                            ])),
                                    Padding(
                                        padding: getPadding(top: 23),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      top: 4, bottom: 6),
                                                  child: Text("02 ",
                                                      style: theme.textTheme
                                                          .headlineSmall)),
                                              Padding(
                                                  padding: getPadding(left: 26),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Process overview",
                                                            style: theme
                                                                .textTheme
                                                                .bodyMedium),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 6),
                                                            child:
                                                                Row(children: [
                                                              Text("6:10",
                                                                  style: theme
                                                                      .textTheme
                                                                      .labelLarge),
                                                              Padding(
                                                                  padding:
                                                                      getPadding(
                                                                          left:
                                                                              8),
                                                                  child: Text(
                                                                      "mins",
                                                                      style: theme
                                                                          .textTheme
                                                                          .labelLarge))
                                                            ]))
                                                      ])),
                                              Spacer(),
                                              CustomIconButton(
                                                  height: 44,
                                                  width: 44,
                                                  margin: getMargin(bottom: 2),
                                                  padding: getPadding(all: 14),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgPlay))
                                            ])),
                                    Padding(
                                        padding: getPadding(top: 23),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      top: 4, bottom: 5),
                                                  child: Text("03 ",
                                                      style: theme.textTheme
                                                          .headlineSmall)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 2),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Discovery",
                                                            style: theme
                                                                .textTheme
                                                                .bodyMedium),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 4),
                                                            child:
                                                                Row(children: [
                                                              Text("6:10",
                                                                  style: theme
                                                                      .textTheme
                                                                      .labelLarge),
                                                              Padding(
                                                                  padding:
                                                                      getPadding(
                                                                          left:
                                                                              8),
                                                                  child: Text(
                                                                      "mins",
                                                                      style: theme
                                                                          .textTheme
                                                                          .labelLarge))
                                                            ]))
                                                      ])),
                                              Spacer(),
                                              Container(
                                                  height: getSize(44),
                                                  width: getSize(44),
                                                  margin: getMargin(bottom: 2),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgButtonplay,
                                                            height: getSize(44),
                                                            width: getSize(44),
                                                            alignment: Alignment
                                                                .center),
                                                        CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgLock,
                                                            height:
                                                                getVerticalSize(
                                                                    20),
                                                            width:
                                                                getHorizontalSize(
                                                                    17),
                                                            alignment: Alignment
                                                                .topCenter,
                                                            margin: getMargin(
                                                                top: 11))
                                                      ]))
                                            ]))
                                  ]))),
                      CustomAppBar(
                          leadingWidth: getHorizontalSize(32),
                          leading: AppbarImage(
                              svgPath: ImageConstant.imgArrowleft,
                              margin: getMargin(left: 25, bottom: 6),
                              onTap: () {
                                onTapArrowleftone(context);
                              }),
                          actions: [
                            AppbarImage1(
                                svgPath: ImageConstant.imgInfo,
                                margin: getMargin(left: 26, right: 26))
                          ])
                    ]))),
            bottomNavigationBar: Container(
                margin: getMargin(left: 54, right: 16, bottom: 34),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgDetails),
                        fit: BoxFit.cover)),
                child: Container(
                    width: getHorizontalSize(304),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(ImageConstant.imgDetails),
                            fit: BoxFit.cover)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: getVerticalSize(17),
                              width: getHorizontalSize(18),
                              decoration: AppDecoration.fillRed.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder12),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgMail,
                                  height: getVerticalSize(17),
                                  width: getHorizontalSize(18),
                                  alignment: Alignment.center)),
                          Expanded(
                              child: CustomElevatedButton(
                                  text: "Buy Now", margin: getMargin(left: 49)))
                        ])))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
