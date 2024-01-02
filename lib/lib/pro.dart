import 'package:flutter/material.dart';

class Task with ChangeNotifier {
  int changecount44 = 0;
  int get changcount22 => changecount44;
  void incriment() {
    changecount44++;
    notifyListeners();
  }

  void decriment() {
    if (changecount44 >= 1) {
      changecount44--;
    }

    notifyListeners();
  }
}
