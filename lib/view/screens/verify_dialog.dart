import 'package:flutter/material.dart';

import '../screens/auth/auth_helper/dialoge_screen.dart';

class VDialog extends StatelessWidget {
  const VDialog({super.key,required this.isGuest,required this.isTeasher});
  final bool isTeasher;
  final bool isGuest;
  @override
  Widget build(BuildContext context) {
    return DialogScreen(
        isGuest: isGuest,
        isTeasher: isTeasher,
        text1: 'Done',
        text2: '''Congratulations, you have 
completed your registration!''',
        icon: Icons.done,
        buttonText: 'Done',
        text1Size: 25,
        text2Size: 17);
  }
}
