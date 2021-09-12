import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  String title = 'default';

  void initialize() {
    title = 'initialised';
    notifyListeners();
  }

  int counter = 0;
  void updateTitle() {
    counter++;
    title = '$counter';
    notifyListeners();
  }
}
