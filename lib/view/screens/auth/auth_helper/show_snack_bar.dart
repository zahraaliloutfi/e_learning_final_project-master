import 'package:flutter/material.dart';

import '../../../global/utill/colors.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorResources.kPrimaryColorBlue,
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
