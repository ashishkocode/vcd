import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  var index = 0;

  int get getIndex {
    return index;
  }

  void changeIndex(indexNo) {
    index = indexNo;
    notifyListeners();
  }
}
