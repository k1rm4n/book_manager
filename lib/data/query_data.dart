import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class QueryData extends ChangeNotifier {
  List<Widget> list = [];
  Color defColorQueryBook = const Color.fromRGBO(124, 124, 124, 1);
  Color defColorReturnBook = const Color.fromRGBO(124, 124, 124, 1);
  Color activeColor = const Color.fromRGBO(76, 61, 255, 1);

  void clearAndAddAll(Widget widget) {
    list.clear();
    list.add(widget);
    notifyListeners();
  }

  void activeColorQueryBook() {
    defColorQueryBook = activeColor;
    notifyListeners();
  }

  void activeColorReturnBook() {
    defColorReturnBook = activeColor;
    notifyListeners();
  }

  void defQueryBook() {
    defColorQueryBook = const Color.fromRGBO(124, 124, 124, 1);
    notifyListeners();
  }

  void defReturnBook() {
    defColorReturnBook = const Color.fromRGBO(124, 124, 124, 1);
    notifyListeners();
  }
}
