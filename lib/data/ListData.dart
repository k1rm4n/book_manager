import 'package:book_manager/connect_db.dart';
import 'package:flutter/material.dart';

import '../query_user.dart';

class ListData extends ChangeNotifier {
  final int userId;
  List<Widget> list = [];

  ListData(this.userId);

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

  void getHistory() async {
    final result = await MyConnection().getHistory(userId);
    if (result != null) {
      list.addAll(result
          .map(
            (book) => HistoryItemBook(
              author: book['name_author'],
              titleBook: book['name_book'],
              urlImage: book['img_book'],
              yearBook: book['year_book'],
            ),
          )
          .toList());
      notifyListeners();
    }
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
