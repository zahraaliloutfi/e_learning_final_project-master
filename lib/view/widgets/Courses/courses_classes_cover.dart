import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../global/utill/custom_fonts.dart';

class CoursesClassesCover extends StatefulWidget {
  const CoursesClassesCover({
    super.key,
    required this.photo,
    required this.tittle,
    required this.color,
    required this.function,
    required this.textColor,
  });

  final String photo;
  final String tittle;
  final Color color;
  final Color textColor;
  final function;

  @override
  State<CoursesClassesCover> createState() => _CoursesClassesCoverState();
}

class _CoursesClassesCoverState extends State<CoursesClassesCover> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget.function ,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 85.sp,
            width: 160.sp,
            margin: EdgeInsets.only(right: 15.sp),
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
                color:widget.color,
                borderRadius: BorderRadius.circular(20.sp)),
            child: Container(
              width: 76.w,
              height: 25.h,
              margin: EdgeInsets.symmetric(vertical: 10.sp),
              padding: EdgeInsets.only(left: 5.sp, top: 5.sp, bottom: 5.sp),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.sp),
                    bottomLeft: Radius.circular(10.sp),
                  )),
              child: Center(
                child: Text(
                  widget.tittle,
                  style: TajwalRegular.copyWith(
                      fontSize: 16.sp,
                      color:widget.textColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Image.asset(
              widget.photo,
              height: 95.h,
              width: 95.w,
              fit: BoxFit.fill,

            ),
          ),
        ],
      ),
    );
  }
}
