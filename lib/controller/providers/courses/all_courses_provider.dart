import 'package:flutter/cupertino.dart';

class AllCoursesProvider extends ChangeNotifier {
  final List _courses = [
    'All',
    "Popular",
    "New",
  ];
  int indexCourse = 0;
  final List _indexList = [0, 1, 2];
  String course = '';

  List get courses => _courses;

  List get indexList => _indexList;


  updateSelectedCourseIndex(int index) {
    indexCourse = indexList[index];
    notifyListeners();
  }

  bool didUpdateSelectedCourseIndex(int index) {
    return indexCourse == indexList[index];
  }

  updateSelectedCourse(int index) {
    course = courses[index];
    notifyListeners();
  }
}
