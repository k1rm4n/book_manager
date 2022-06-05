import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../admin/readers_admin.dart';
import '../connect_db.dart';

class ReaderData extends ChangeNotifier {
  List<Widget> list = [];
  Color defColorReaders = const Color.fromRGBO(124, 124, 124, 1);
  Color defColorPromiser = const Color.fromRGBO(124, 124, 124, 1);
  Color activeColor = const Color.fromRGBO(76, 61, 255, 1);

  Future<void> getReaders() async {
    final result = await MyConnection().getReaders();
    if (result != null) {
      list.clear();
      list.addAll(result
          .map((readers) => ListItemWidget(
                firstName: readers['firstname'],
                lastName: readers['lastname'],
              ))
          .toList());
      notifyListeners();
    }
  }

  Future<void> getDebtor() async {
    final result = await MyConnection().getDebtor();
    if (result != null) {
      list.clear();
      list.addAll(result
          .map((readers) => ListItemWidget(
                firstName: readers['firstname'],
                lastName: readers['lastname'],
              ))
          .toList());
      notifyListeners();
    }
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
