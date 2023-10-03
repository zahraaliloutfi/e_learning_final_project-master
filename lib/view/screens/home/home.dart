import 'package:e_learning_final_project/view/global/utill/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../generated/l10n.dart';
import '../../global/utill/custom_fonts.dart';
import '../../global/utill/dimensions.dart';

class Home extends StatefulWidget {
  Home({super.key,  this.name=''});
  String? name;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  color: const Color(0xff3d5cff),
                  height: 150.h,
                  // height of AppBar
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).hi,
                              style: TajwalRegular.copyWith(
                                  color: Colors.white,
                                  fontSize: Dimensions.FONT_SIZE_OVER_LARGE.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${widget.name == null ? '' : widget.name!}',
                              style: TajwalRegular.copyWith(
                                  color: Colors.white,
                                  fontSize: Dimensions.FONT_SIZE_OVER_LARGE.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              S.of(context).letstartlearning,
                              style: TajwalRegular.copyWith(
                                  color: Colors.white,
                                  fontSize: Dimensions.FONT_SIZE_LARGE.sp),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 30.r,
                          child: Icon(
                            Icons.person,
                            size: 60,
                          ),
                        )
                      ],
                    ),
                  )),
              Container(
                child: SingleChildScrollView(
                  child: Container(
                      // height: 700,
                      color: ColorResources.getprimary(context),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 18.0.h, bottom: 18.0.h),
                                child: Text(
                                  S.of(context).whatdouwanttolearntoday,
                                  style: TajwalRegular.copyWith(
                                      color: ColorResources.gettextcolor(context),
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          Dimensions.FONT_SIZE_EXTRA_LARGE.sp),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 170.h,
                              child: ListView.separated(
                                  itemCount: 4,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      width: 300.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(23.r),
                                        color: const Color(0xffceecfe),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 50.0.h,
                                                left: 5.w,
                                                right: 5.w),
                                            child: ElevatedButton(
                                              style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll<
                                                            Color>(
                                                        Colors.deepOrange),
                                              ),
                                              onPressed: () {},
                                              child: Text(
                                                S.of(context).getstarted,
                                                style: TextStyle(
                                                    fontFamily: 'Tajawal',
                                                    fontSize: Dimensions
                                                        .FONT_SIZE_EXTRA_SMALL
                                                        .sp,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Image(
                                              height: 150.h,
                                              width: 150.w,
                                              image: AssetImage(
                                                  "assets/images/home_images/home1.png")),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 12.0.h, bottom: 12.0.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  S.of(context).learningplan,
                                  style: TajwalRegular.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          Dimensions.FONT_SIZE_EXTRA_LARGE.sp),
                                ),
                              ),
                            ),
                            Container(
                              height: 120.h,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 5.r,
                                    blurRadius: 7.r,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15.r),
                                color: ColorResources.thirdcolors(context),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Icon(
                                              Icons.brightness_1_outlined,
                                              size: Dimensions.ICON_SIZE_LARGE,
                                              color: ColorResources.textColor(
                                                  context),
                                            ),
                                          ),
                                          Text("Packageing Design",
                                              style: TajwalRegular.copyWith(
                                                  fontSize: Dimensions
                                                      .FONT_SIZE_DEFAULT.sp,
                                                  color:
                                                      ColorResources.textColor(
                                                          context),
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Text(
                                          "40/48",
                                          style: TajwalRegular.copyWith(
                                              fontSize: Dimensions
                                                  .FONT_SIZE_DEFAULT.sp,
                                              color: ColorResources.textColor(
                                                  context),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Icon(
                                              Icons.brightness_1_outlined,
                                              size: Dimensions.ICON_SIZE_LARGE,
                                              color: ColorResources.textColor(
                                                  context),
                                            ),
                                          ),
                                          Text("Product Design",
                                              style: TajwalRegular.copyWith(
                                                  fontSize: Dimensions
                                                      .MARGIN_SIZE_DEFAULT.sp,
                                                  color:
                                                      ColorResources.textColor(
                                                          context),
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Text(
                                          "45/50",
                                          style: TajwalRegular.copyWith(
                                              fontSize: Dimensions
                                                  .FONT_SIZE_DEFAULT.sp,
                                              color: ColorResources.textColor(
                                                  context),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              height: 130.h,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 5.r,
                                    blurRadius: 7.r,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15.r),
                                color: Color(0xffdfcfe3),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.8,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.of(context).meetup,
                                          style: TajwalRegular.copyWith(
                                            fontSize: Dimensions
                                                .FONT_SIZE_OVER_LARGE.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepPurple,
                                          ),
                                        ),
                                        Text(
                                          S.of(context).offline_exchange,
                                          overflow: TextOverflow.fade,
                                          style: TajwalRegular.copyWith(
                                              fontSize: Dimensions
                                                  .FONT_SIZE_EXTRA_SMALL.sp,
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/home_images/home2.png",
                                    height: 180.h,
                                    width: 80.w,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
