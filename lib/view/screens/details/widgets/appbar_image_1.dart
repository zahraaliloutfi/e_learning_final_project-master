import 'package:e_learning_final_project/view/screens/details/widgets/size_utils.dart';
import 'package:flutter/material.dart';

import 'custom_image_view.dart';

// ignore: must_be_immutable
class AppbarImage1 extends StatelessWidget {
  AppbarImage1({
    Key? key,
    this.imagePath,
    this.svgPath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  String? svgPath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          svgPath: svgPath,
          imagePath: imagePath,
          height: getVerticalSize(14),
          width: getHorizontalSize(7),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
