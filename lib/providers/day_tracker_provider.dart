import 'package:flutter/material.dart';

class DayTrackerProvider extends ChangeNotifier {
  late BuildContext context;

  init({required BuildContext context}) {
    this.context = context;
  }

  bool isopen = true;
  int colorvalue = 1;
  setColorValue(int val) {
    colorvalue = val;
    notifyListeners();
  }
  setLoading(bool val) {
    isopen = val;
    notifyListeners();
  }
}