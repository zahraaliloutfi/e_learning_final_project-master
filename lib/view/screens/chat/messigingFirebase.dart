import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../global/utill/colors.dart';
import '../../global/utill/custom_fonts.dart';
import '../../global/utill/dimensions.dart';
import 'chapPage.dart';

class MessagingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Card(
        elevation: 2,
        shadowColor: Colors.grey,
        color: ColorResources.thirdcolors(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (ChatScreen())));
                },
                leading: Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: const Color(0xfff4f4ff),
                  ),
                ),
                title: Text(
                  "New Message",
                  style: TajwalRegular.copyWith(
                      color: ColorResources.textColor(context),
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.FONT_SIZE_DEFAULT),
                ),
                trailing: Text("",
                    style: TajwalRegular.copyWith(
                        color: Colors.grey,
                        fontSize: Dimensions.FONT_SIZE_DEFAULT)),
              ),
              Text(
                'new message in your group chat',
                style: TajwalRegular.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorResources.textColor(context),
                    fontSize: Dimensions.FONT_SIZE_DEFAULT),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
