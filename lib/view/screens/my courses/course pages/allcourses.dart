import 'package:e_learning_final_project/controller/providers/courses/all_courses_provider.dart';
import 'package:e_learning_final_project/view/global/utill/colors.dart';
import 'package:e_learning_final_project/view/global/utill/images.dart';
import 'package:e_learning_final_project/view/screens/details/details.dart';
import 'package:e_learning_final_project/view/widgets/Courses/course_bottom_sheet.dart';
import 'package:e_learning_final_project/view/widgets/Courses/course_view.dart';
import 'package:e_learning_final_project/view/widgets/Courses/courses_classes_cover.dart';
import 'package:e_learning_final_project/view/widgets/Courses/coursetype.dart';
import 'package:e_learning_final_project/view/widgets/searchbottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../generated/l10n.dart';
import '../../../global/utill/custom_fonts.dart';

class AllCourses extends StatefulWidget {
  const AllCourses({super.key});

  @override
  State<AllCourses> createState() => _AllCoursesState();
}

ScrollController _scrollController = ScrollController();

class _AllCoursesState extends State<AllCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.sp),
              height: 40.h,
              child: SearchBar(
                backgroundColor: MaterialStateProperty.all(Color(0xfff4f3fd)),
                elevation: MaterialStateProperty.all(.3),
                shadowColor: MaterialStateProperty.all(Colors.blueAccent),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    minHeight: 40.sp),
                leading: IconButton(
                  icon: const Icon(
                    Icons.filter_list_sharp,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        ),
                      ),
                      context: context,
                      builder: (context) => SearchFieldSheet(),
                    );
                  },
                ),
                shape: MaterialStateProperty.all(
                  ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(35.sp),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100.h,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  CoursesClassesCover(
                    color: const Color(0xffffebf0),
                    tittle: S.of(context).language,
                    function: null,
                    photo: AssetsManager.language,
                    textColor: Colors.deepOrange,
                  ),
                  CoursesClassesCover(
                    color: const Color(0xffb7ccfb),
                    tittle: S.of(context).painting,
                    function: null,
                    photo: AssetsManager.paintaing,
                    textColor: Colors.blue,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.0.h),
              height: 20.h,
              child: Text(
                S.of(context).choose_your_course,
                style: TajwalRegular.copyWith(
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorResources.gettextcolor(context)),
              ),
            ),
            Consumer<AllCoursesProvider>(
              builder: (context, allProvider, child) {
                return SizedBox(
                  height: 32.h,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CourseType(
                            text: allProvider.courses[index],
                            function: () {
                              allProvider.updateSelectedCourseIndex(index);
                              allProvider.updateSelectedCourse(index);
                            },
                            color:
                                allProvider.didUpdateSelectedCourseIndex(index)
                                    ? Colors.blueAccent
                                    : Colors.blueGrey,
                            textcolor:
                                allProvider.didUpdateSelectedCourseIndex(index)
                                    ? Colors.white
                                    : Colors.white,
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                      itemCount: allProvider.courses.length),
                );
              },
            ),
            ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return CourseView(
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CourseDetails()));
                  },
                  name: 'Course name',
                  puplisher: 'Course publisher',
                  image:
                      'https://images.freeimages.com/vhq/images/previews/866/psd-freebie-ipad-mock-up-close-up-509103.jpg',
                  price: "1236 \$",
                  hours: '36',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
