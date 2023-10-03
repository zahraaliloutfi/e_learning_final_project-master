import 'package:e_learning_final_project/view/screens/auth/auth_helper/dialoge_screen.dart';
import 'package:flutter/material.dart';
//gyust dialog
class GDialogScreen extends StatelessWidget {
  const GDialogScreen({super.key,required this.isGuest ,required this.isTeasher});
  final bool isTeasher;
  final bool isGuest;
  @override
  Widget build(BuildContext context) {
    return DialogScreen(
      isGuest: isGuest,
      isTeasher: isTeasher,
      buttonText: 'Ok',
      icon: Icons.close,
      text1: 'Sorry',
      text2: '''you don\'t have an access to 
open it,Sign up or login to 
have an access ..  ''',
      text2Size: 17,
      text1Size: 25,
    );
  }
}
