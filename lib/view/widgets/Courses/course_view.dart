import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../global/utill/colors.dart';
import '../../global/utill/custom_fonts.dart';

class CourseView extends StatefulWidget {
  const CourseView({
    super.key,
    required this.image,
    required this.hours,
    required this.price,
    required this.name,
    required this.puplisher,
    required this.function,
  });

  final String image;
  final String name;
  final String puplisher;

  final String hours;

  final String price;
  final function;

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Container(

        decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(15),),
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(5),
        height: 100,
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.name,
                  style: TajawalMedium.copyWith(
                      color: ColorResources.gettextcolor(context)),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.grey[400],
                    ),
                    Text(
                      widget.puplisher,
                      style: TajwalRegular.copyWith(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      widget.price,
                      style: TajawalMedium.copyWith(color: Colors.blueAccent),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 70,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Color(0xffffebf0),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          widget.hours,
                          style:
                              TajwalRegular.copyWith(color: Colors.deepOrange),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
