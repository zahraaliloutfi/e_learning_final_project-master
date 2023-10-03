import 'package:flutter/cupertino.dart';

import '../../global/utill/colors.dart';

class ProfileTextAppBar extends StatelessWidget {
  const ProfileTextAppBar({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 40,
        left: 20,
        bottom: 40,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: ColorResources.textColor(context),
          fontWeight: FontWeight.w900,
          fontFamily: 'Tajawal',
          fontSize: 25,
        ),
      ),
    );
  }
}