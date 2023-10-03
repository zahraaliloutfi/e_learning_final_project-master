import 'package:e_learning_final_project/controller/providers/searchprovider.dart';
import 'package:e_learning_final_project/view/global/utill/colors.dart';
import 'package:e_learning_final_project/view/global/utill/custom_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Courses/category_type.dart';
import 'Courses/coursetype.dart';

class SearchFieldSheet extends StatefulWidget {
  const SearchFieldSheet({super.key});

  @override
  State<SearchFieldSheet> createState() => _SearchFieldSheetState();
}

class _SearchFieldSheetState extends State<SearchFieldSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * (2 / 3),
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 4.7),
                  child: Text(
                    'Search Filter',
                    style: TajawalMedium.copyWith(
                      color: ColorResources.gettextcolor(context),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15.0.sp),
              child: Text(
                'Categories',
                style: TajawalMedium.copyWith(
                    color: ColorResources.gettextcolor(context),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Consumer<CoursesCategoriesProvider>(
                builder: (context, categoriesProvider, child) {
              return SizedBox(
                height: MediaQuery.of(context).size.height/7.6,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .4,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesProvider.categories.length,
                  itemBuilder: (context, index) {
                    return CategoryType(
                      text: categoriesProvider.categories[index],
                      function: () {
                        categoriesProvider.updateSelectedCourseIndex(index);
                        categoriesProvider.updateSelectedCourse(index);
                      },
                      color:
                          categoriesProvider.didUpdateSelectedCourseIndex(index)
                              ? Colors.blueAccent
                              : Colors.grey[200],
                      textcolor:
                          categoriesProvider.didUpdateSelectedCourseIndex(index)
                              ? Colors.white
                              : Colors.black,
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
