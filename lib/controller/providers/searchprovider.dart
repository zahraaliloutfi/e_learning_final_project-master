import 'package:flutter/cupertino.dart';

class CoursesCategoriesProvider extends ChangeNotifier {
  final List _categories = [
    'Design',
    "Painting",
    "Mathematics",
    "Coding",
    "language",
  ];
  int indexCategory = 0;
  final List _indexList = [0, 1, 2,3,4];
  String category = '';

  List get categories => _categories;

  List get indexList => _indexList;


  updateSelectedCourseIndex(int index) {
    indexCategory = indexList[index];
    notifyListeners();
  }

  bool didUpdateSelectedCourseIndex(int index) {
    return indexCategory == indexList[index];
  }

  updateSelectedCourse(int index) {
    category = categories[index];
    notifyListeners();
  }
}
