import 'package:e_learning_final_project/view/global/utill/custom_fonts.dart';
import 'package:flutter/material.dart';

class CourseType extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textcolor;
  final Function()? function;

  const CourseType({
    super.key,
    required this.text,
    required this.color,
    required this.textcolor,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: 90,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            text!,
            style: TajawalMedium.copyWith(
              color: textcolor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
