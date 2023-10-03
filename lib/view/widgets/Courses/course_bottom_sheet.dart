import 'package:e_learning_final_project/view/widgets/Courses/upload_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../global/utill/colors.dart';
import '../../global/utill/custom_fonts.dart';

class CourseBottomSheet extends StatefulWidget {
  const CourseBottomSheet({super.key});

  @override
  State<CourseBottomSheet> createState() => _CourseBottomSheetState();
}

class _CourseBottomSheetState extends State<CourseBottomSheet> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      height: MediaQuery.of(context).size.height / 2,
      child: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ADD Course',
                style: TajawalMedium.copyWith(
                    color: ColorResources.gettextcolor(context), fontSize: 25),
              ),
              Container(
                color: Colors.blueGrey,
                height: 2,
              ),
              ImageUpload(
                ctx: context,
              ),
              const CourseTextField(
                text: 'Course Tittle',
                isHours: false,
                isPrice: false,
                isTiitle: true,
              ),
              const CourseTextField(
                text: 'Price',
                isHours: false,
                isPrice: true,
                isTiitle: false,
              ),
              const CourseTextField(
                text: 'Course Hours',
                isHours: true,
                isPrice: false,
                isTiitle: false,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 40)),
                child: Text(
                  'Add Course',
                  style: TajwalRegular.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseTextField extends StatefulWidget {
  const CourseTextField({
    super.key,
    required this.text,
    required this.isTiitle,
    required this.isPrice,
    required this.isHours,
  });

  final String text;
  final bool isTiitle;
  final bool isPrice;
  final bool isHours;

  @override
  State<CourseTextField> createState() => _CourseTextFieldState();
}

class _CourseTextFieldState extends State<CourseTextField> {
  late String tittle, price, hours;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 2, color: ColorResources.gettextcolor(context)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: widget.text,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2,
              color: ColorResources.gettextcolor(context).withOpacity(.2)),
          borderRadius: BorderRadius.circular(20.0),
        ),

        // labelText: widget.text,
        labelStyle: TajwalRegular.copyWith(
            color: ColorResources.gettextcolor(context),
            fontWeight: FontWeight.w600),
        label: Text(
          widget.text,
          style: const TextStyle(fontSize: 20),
        ),
        border: OutlineInputBorder(
          borderSide:
          BorderSide(width: 2, color: ColorResources.gettextcolor(context)),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onSaved: (val) {
        if (widget.isTiitle) {
          tittle = val!;
        } else if (widget.isPrice) {
          hours = val!;
        } else if (widget.isHours) {
          hours = val!;
        }
      },
    );
  }
}
