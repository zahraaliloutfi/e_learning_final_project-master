import 'package:e_learning_final_project/view/global/utill/colors.dart';
import 'package:e_learning_final_project/view/global/utill/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../global/utill/custom_fonts.dart';
import 'chapPage.dart';

class MessagesScreen extends StatelessWidget {
  final List messages = [
    'Congratulations on completing the the first lesson. Keep up the good work!',
    'Your course has been updated, you can check the new course in your study course.',
    'Congratulation you have passed the test.',
  ];
  final List names = [
    'Bert Pullman',
    'Danial Lawson',
    'Nguyen shane',
  ];
  final List dates = ['04:32 pm', '04:00 pm', "12:00 am"];
  final List state = ['offline', 'online', 'online'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Card(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (ChatScreen())));
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
                      names[index],
                      style: TajwalRegular.copyWith(
                          color: ColorResources.textColor(context),
                          fontSize: Dimensions.FONT_SIZE_DEFAULT),
                    ),
                    subtitle: Text(state[index],
                        style: TajwalRegular.copyWith(
                            color: Colors.grey,
                            fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                    trailing: Text(dates[index],
                        style: TajwalRegular.copyWith(
                            color: Colors.grey,
                            fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                  ),
                  Text(
                    messages[index],
                    style: TajwalRegular.copyWith(
                        color: ColorResources.textColor(context),
                        fontSize: Dimensions.FONT_SIZE_DEFAULT),
                  )
                ],
              ),
            ),
          );
        });
  }
}
