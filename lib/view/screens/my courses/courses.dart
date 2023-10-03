import 'package:e_learning_final_project/view/global/utill/colors.dart';
import 'package:e_learning_final_project/view/screens/my%20courses/course%20pages/allcourses.dart';
import 'package:e_learning_final_project/view/screens/my%20courses/course%20pages/mycourses.dart';
import 'package:e_learning_final_project/view/widgets/pageviewwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/l10n.dart';
import '../../global/utill/custom_fonts.dart';
import '../../global/utill/images.dart';
import '../../widgets/Courses/course_bottom_sheet.dart';
import '../profile/EditprofileScreen.dart';

class Courses extends StatefulWidget {
  const Courses({super.key, required this.isGuest, required this.isTeasher});

  final bool isTeasher;
  final bool isGuest;

  @override
  State<Courses> createState() => _CoursesState();
}
// PageController _pageController = PageController(initialPage: 0);

class _CoursesState extends State<Courses> {
  late final List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': const AllCourses(), 'title': 'All Courses'},
      {'page': const MyCourses(), 'title': 'My Courses'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: IconButton(
              padding: EdgeInsets.all(5),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Theme.of(context).highlightColor,
                        title: Text('Mahmoud',style: TajawalMedium.copyWith(
                          color: ColorResources.gettextcolor(context),
                        ),),
                        content: Text(S.of(context).question,style: TajawalMedium.copyWith(
                          color: ColorResources.gettextcolor(context),
                          fontSize: 15
                        ),),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfileScreen(),
                                ),
                              );
                              setState(() {});
                            },
                            child: Text(S.of(context).yes,style: TajawalMedium.copyWith(
                              color: Colors.white
                            ),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text(S.of(context).no,style:  TajawalMedium.copyWith(
                                color: Colors.white
                            ),),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey
                            ),
                          ),
                        ],
                      );
                    });
              },
              icon: Image.asset(
                AssetsManager.profile,
              ),
            ),
          )
        ],
        title: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            S.of(context).course,
            style: TajwalRegular.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: ColorResources.gettextcolor(context),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: PageViewWidget(
        pages: _pages,
        text1: S.of(context).allcourses,
        text2: S.of(context).mycourses,
        underTextColor: Colors.red,
      ),
      floatingActionButton: widget.isGuest
          ? null
          : widget.isTeasher
              ? Padding(
                padding:  EdgeInsets.symmetric(vertical: 18.0.h),
                child: FloatingActionButton(
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                          ),
                          // isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return const CourseBottomSheet();
                          });
                    },
                    child: Icon(
                      Icons.add,
                      size: 35,
                    ),
                  ),
              )
              : null,
    );
  }
}
