import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../global/utill/colors.dart';
import '../../global/utill/custom_fonts.dart';
import '../../global/utill/dimensions.dart';

class NotificationScreen extends StatelessWidget {
  final List messages = [
    'successful Purchase!',
    'Congratulations on completeing the course',
    'Your course has been updated',
    'Congratulation you have passed the test'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            shadowColor: Colors.grey,
            color: ColorResources.thirdcolors(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: ListTile(
              leading: Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: const Color(0xfff4f4ff),
                ),
                child: const Icon(
                  Icons.message,
                  size: 30,
                  color: Color(0xff3d5cff),
                ),
              ),
              title: Text(
                messages[index],
                style: TajwalRegular.copyWith(
                    color: ColorResources.textColor(context),
                    fontSize: Dimensions.FONT_SIZE_DEFAULT),
              ),
              subtitle: Text('just now',
                  style: TajwalRegular.copyWith(
                    color: Colors.grey,
                  )),
            ),
          );
        });
  }
}
