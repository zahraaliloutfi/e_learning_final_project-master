import 'package:e_learning_final_project/view/global/utill/colors.dart';
import 'package:e_learning_final_project/view/global/utill/images.dart';
import 'package:e_learning_final_project/view/screens/chat/chat.dart';
import 'package:e_learning_final_project/view/screens/chatgpt/chatgpt.dart';
import 'package:e_learning_final_project/view/screens/home/home.dart';
import 'package:e_learning_final_project/view/screens/my%20courses/courses.dart';
import 'package:e_learning_final_project/view/screens/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'CustonPaint.dart';

class BottomNavBarV2 extends StatefulWidget {
  const BottomNavBarV2({super.key});

  @override
  _BottomNavBarV2State createState() => _BottomNavBarV2State();
}

class _BottomNavBarV2State extends State<BottomNavBarV2> {

  final currentUser = FirebaseAuth.instance.currentUser;

  int currentIndex = 0;
  late final List<Map<String, dynamic>> _pages;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': Home(
          // name: '${widget.name}',
        ),
        'title': 'Home'
      },
      {
        'page': const Courses(
          isTeasher: true,
          isGuest:   false,
        ),
        'title': 'Courses'
      },
      {'page': const ChatScreen(), 'title': 'Profile'},
      {'page': const ProfileScreen(), 'title': 'Profile'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // List<Widget> pages = [
    //   Home(),
    //   const Courses(isGuest: false, isTeasher: false),
    //   ChatScreen(),
    //   const ProfileScreen( ),
    // ];

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor ,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: _pages[currentIndex]['page'],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: size.width,
              height: 75,
              child: Stack(
                clipBehavior: Clip.none, children: [
                  CustomPaint(
                    size: Size(size.width, 80),

                    painter: BNBCustomPainter( context),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                      backgroundColor: ColorResources.kPrimaryColorOrange,
                      elevation: 0.1,
                      onPressed: () {
                        // Handle floating action button press
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatGPT()));
                      },
                      child:  Image.asset(AssetsManager.ChatGPTIcon),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 80,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.home,
                            color: currentIndex == 0
                                ?   ColorResources.kPrimaryColorOrange
                                : Colors.grey,
                          ),
                          onPressed: () {
                            setBottomBarIndex(0);
                          },
                          splashColor: Colors.white,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.book,
                            color: currentIndex == 1
                                ? ColorResources.kPrimaryColorOrange
                                : Colors.grey,
                          ),
                          onPressed: () {
                            setBottomBarIndex(1);
                          },
                        ),
                        SizedBox(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.message_outlined,
                            color: currentIndex == 2
                                ?  ColorResources.kPrimaryColorOrange
                                : Colors.grey,
                          ),
                          onPressed: () {
                            setBottomBarIndex(2);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.person,
                            color: currentIndex == 3
                                ?  ColorResources.kPrimaryColorOrange
                                : Colors.grey,
                          ),
                          onPressed: () {
                            setBottomBarIndex(3);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Display the selected page based on currentIndex

        ],
      ),
    );
  }
}


