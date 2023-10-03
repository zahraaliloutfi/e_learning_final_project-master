import 'package:e_learning_final_project/controller/providers/navigation%20provider/navigation_provider.dart';
import 'package:e_learning_final_project/view/screens/chat/chat.dart';
import 'package:e_learning_final_project/view/screens/chatgpt/chatgpt.dart';
import 'package:e_learning_final_project/view/screens/home/home.dart';
import 'package:e_learning_final_project/view/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../my courses/courses.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen(
      {Key? key, this.name, required this.isGuest, required this.isTeasher})
      : super(
          key: key,

        );
  String? name = 'user';
  final bool isTeasher;
  final bool isGuest;

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final currentUser = FirebaseAuth.instance.currentUser;
  late final List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': Home(
          name: '${widget.name}',
        ),
        'title': 'Home'
      },
      {
        'page': Courses(
          isTeasher: widget.isTeasher,
          isGuest: widget.isGuest,
        ),
        'title': 'Courses'
      },
      {'page': const ChatGPT(), 'title': 'Profile'},
      {'page': const ChatScreen(), 'title': 'Profile'},
      {'page': const ProfileScreen(), 'title': 'Profile'},
    ];
  }

  int _selectedPageIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
        builder: (context, navigationProvider, child) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey[350],
          currentIndex: navigationProvider.selectedIndex,
          onTap: (index) {
            navigationProvider.updateSelectedIndex(
                index, _pageController, true);
            _pageController.animateTo(index as double,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInBack);
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_filled), label: S.of(context).home),
            BottomNavigationBarItem(
                icon: const Icon(Icons.book), label: S.of(context).courses),
            const BottomNavigationBarItem(
                icon: Icon(Icons.open_with), label: 'ChatGPT'),
            BottomNavigationBarItem(
                icon: const Icon(Icons.message_outlined),
                label: S.of(context).chat),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: S.of(context).account),
          ],
        ),
        body: SafeArea(
          child: PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return _pages[index]['page'];
            },
            onPageChanged: (int index) {
              navigationProvider.updateSelectedIndex(
                  index, _pageController, false);
            },
          ),
        ),
      );
    });
  }
}
