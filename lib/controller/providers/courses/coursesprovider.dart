import 'package:flutter/cupertino.dart';

class CoursesProvider extends ChangeNotifier{
  int _selectedindex =0;
  int get selectedIndex => _selectedindex;
  set selectedIndex (val) => _selectedindex;

  updateSelectedIndex(int index) {
    _selectedindex = index;
    notifyListeners();
  }
}