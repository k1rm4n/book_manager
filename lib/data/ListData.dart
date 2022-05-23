import 'package:flutter/material.dart';

class ListData extends ChangeNotifier {
  List<Widget> list = [];

  void clearAndAddAll(Widget widget) {
    list.clear();
    list.add(widget);
    notifyListeners();
  }

  Color defColorYouRead = const Color.fromRGBO(124, 124, 124, 1);
  Color defColorInWaint = const Color.fromRGBO(124, 124, 124, 1);
  Color defColorHistory = const Color.fromRGBO(124, 124, 124, 1);
  Color activColor = const Color.fromRGBO(76, 61, 255, 1);

  void activeColorYouRead() {
    defColorYouRead = activColor;
    notifyListeners();
  }

  void activeInWait() {
    defColorInWaint = activColor;
    notifyListeners();
  }

  void activeHistory() {
    defColorHistory = activColor;
    notifyListeners();
  }

  void defYouRead() {
    defColorYouRead = const Color.fromRGBO(124, 124, 124, 1);
    notifyListeners();
  }

  void defInWait() {
    defColorInWaint = const Color.fromRGBO(124, 124, 124, 1);
    notifyListeners();
  }

  void defHistory() {
    defColorHistory = const Color.fromRGBO(124, 124, 124, 1);
    notifyListeners();
  }
}
