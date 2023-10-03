import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/providers/courses/coursesprovider.dart';
import '../global/utill/colors.dart';
import '../global/utill/custom_fonts.dart';
import '../global/utill/dimensions.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({
    super.key,
    required this.pages,
    required this.underTextColor,
    required this.text1,
    required this.text2,
  });

  final List<Map<String, dynamic>> pages;
  final Color underTextColor;
  final String text1;
  final String text2;

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

PageController _pageController = PageController(initialPage: 0);

class _PageViewWidgetState extends State<PageViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Positioned(
                bottom: 0,
                right: Dimensions.MARGIN_SIZE_EXTRA_SMALL,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width - 200,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              Selector<CoursesProvider, int>(
                selector: (context, index) => index.selectedIndex,
                builder: (context, courseprovider, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                              child: Text(
                                widget.text1,
                                style: TajawalMedium.copyWith(
                                  color: ColorResources.gettextcolor(context),
                                ),
                              ),
                            ),
                            TweenAnimationBuilder<double>(
                              tween: Tween(
                                  begin: courseprovider == 0 ? 1.0 : 0.0,
                                  end: courseprovider == 0 ? 0.0 : 1.0),
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear,
                              builder: (context, value, child) {
                                return Transform.translate(
                                  offset: Offset(value * 55, 0),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    height: 3,
                                    width: 100,
                                    margin: EdgeInsets.only(top: 8),
                                    // padding: EdgeInsets.symmetric(horizontal: 100),
                                    color: courseprovider == 0
                                        ? widget.underTextColor
                                        : Colors.transparent,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _pageController.animateToPage(
                            1,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                              child: Text(
                                widget.text2,
                                style: TajawalMedium.copyWith(
                                  color: ColorResources.gettextcolor(context),
                                ),
                              ),
                            ),
                            TweenAnimationBuilder<double>(
                              tween: Tween(
                                  begin: courseprovider == 1 ? 1.0 : 0.0,
                                  end: courseprovider == 1 ? 0.0 : 1.0),
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              builder: (context, value, child) {
                                return Transform.translate(
                                  offset: Offset(value * -35, 0),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    height: 3,
                                    width: 100,
                                    margin: EdgeInsets.only(top: 8),
                                    color: courseprovider == 1
                                        ? widget.underTextColor
                                        : Colors.transparent,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          Selector<CoursesProvider, CoursesProvider>(
              selector: (context, course) => course,
              builder: (context, courseprovider, child) {
                return Expanded(
                  child: PageView.builder(
                    itemCount: 2,
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      courseprovider.updateSelectedIndex(index);
                      return widget.pages[courseprovider.selectedIndex]['page'];
                    },
                    onPageChanged: (index) {
                      courseprovider.updateSelectedIndex(index);
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
