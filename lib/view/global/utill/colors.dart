import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/providers/themeprovider.dart';

class ColorResources {
  static Color getprimary(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF1F1F39)
        : const Color(0xFFFFFFFF);
  }

  static Color getsecondary(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xff2f2f42)
        : const Color(0xfff0f0f2);
  }

  static Color thirdcolors(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xff2f2f42)
        : const Color(0xFFFFFFFF);
  }

  static Color textColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF1E1E1E);
  }
  static Color gettextcolor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF1F1F39);
  }
  static Color getsecondary2(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xff2f2f42)
        : const Color(0xFFFFFFFF);
  }

  static const Color kPrimaryColor = Color(0xffF0F0F2);
  static const Color kPrimaryColorOrange = Color(0xffDB4B17);
  static const Color kPrimaryColorBlue = Color(0xff3D5CFF);
  static const Color kPrimaryColorGrey = Colors.grey;
  static const Color kPrimaryColorWhite = Colors.white;
  static const Color kPrimaryColorblack = Colors.black;
}
