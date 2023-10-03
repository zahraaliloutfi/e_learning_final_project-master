
import 'package:flutter/material.dart';

import '../global/utill/colors.dart';

class CustomTextFormField extends StatelessWidget {
  String? hintText;
  Widget? suffix;
  bool obscureText;
  Function(String)? onChanged;
  CustomTextFormField(
      {super.key,
      this.onChanged,
      this.hintText,
      this.suffix,
      required this.obscureText});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        obscureText: obscureText,
        // keyboardType: TextInputType.emailAddress,
        validator: (data) {
          if (data!.isEmpty) {
            return 'field if empty ';
          }
          return null;
          // else if (!EmailValidator.validate(data)) {
          //   return 'invalid';
          // }
        },
        onChanged: onChanged,
        autocorrect: true,
        decoration: InputDecoration(
          suffixIcon: suffix,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorResources.kPrimaryColorGrey,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorResources.kPrimaryColorGrey),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorResources.kPrimaryColorGrey,
            ),
          ),
        ),
      ),
    );
  }
}
