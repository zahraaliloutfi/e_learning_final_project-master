import 'dart:ui';

import 'package:e_learning_final_project/view/global/utill/colors.dart';
import 'package:e_learning_final_project/view/global/utill/custom_fonts.dart';
import 'package:e_learning_final_project/view/widgets/Courses/progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: ColorResources.getsecondary2(context),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).learned_today,
                    style: TajawalMedium.copyWith(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        '46 min',
                        style: TajawalMedium,
                      ),
                      Text(
                        ' / 60 min',
                        style: TajawalMedium.copyWith(
                            color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                  ProgressWidget(
                    color: Colors.deepOrangeAccent,
                    percent: (46 / 60),
                    width: MediaQuery.of(context).size.width - 70.w,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: .9,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Course Name',
                            style: TajawalMedium.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: ProgressWidget(
                              color: Colors.blueAccent,
                              percent: (14 / 24),
                              width: MediaQuery.of(context).size.width / 2.6,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                   S.of(context).completed,
                                    style: TajwalRegular.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black38),
                                   ),
                                  Text(
                                    "14 / 24",
                                    style: TajawalMedium.copyWith(fontSize: 22),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(8),
                                    shape: const CircleBorder(),
                                    backgroundColor: Color(0xff3d5cff),
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    size: 30,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
