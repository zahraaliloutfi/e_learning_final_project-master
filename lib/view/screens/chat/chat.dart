import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_final_project/view/global/utill/colors.dart';
import 'package:e_learning_final_project/view/widgets/pageviewwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/l10n.dart';
import '../../global/utill/custom_fonts.dart';
import 'messigingFirebase.dart';
import 'notification.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  PageController _controller = PageController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  late User _user;

  late final List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      {'page': MessagingScreen(), 'title': 'Message'},
      {'page': NotificationScreen(), 'title': 'Notification'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getprimary(context),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          S.of(context).notifications,
          style: TajwalRegular.copyWith(
            color: ColorResources.gettextcolor(context),
            fontWeight: FontWeight.bold,
            fontSize: 23.sp,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: PageViewWidget(
          pages: _pages,
          underTextColor: Colors.blue,
          text1: S.of(context).message,
          text2: S.of(context).notifications),
    );
  }
}
