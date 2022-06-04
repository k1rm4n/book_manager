import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ReaderData extends ChangeNotifier {
  List<Widget> list = [];
  Color defColorReaders = const Color.fromRGBO(124, 124, 124, 1);
  Color defColorPromiser = const Color.fromRGBO(124, 124, 124, 1);
  Color activeColor = const Color.fromRGBO(76, 61, 255, 1);

  void clearAndAddAll(Widget widget) {
    list.clear();
    list.add(widget);
    notifyListeners();
  }

  void activeColorReaders() {
    defColorReaders = activeColor;
    notifyListeners();
  }

  void activeColorPromiser() {
    defColorPromiser = activeColor;
    notifyListeners();
  }

  void defReaders() {
    defColorReaders = const Color.fromRGBO(124, 124, 124, 1);
    notifyListeners();
  }

  void defPromiser() {
    defColorPromiser = const Color.fromRGBO(124, 124, 124, 1);
    notifyListeners();
  }
}
