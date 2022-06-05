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
      list.clear();
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

  void getWait() async {
    final result = await MyConnection().getWaitBook(userId);
    if (result != null) {
      list.clear();
      list.addAll(result
          .map(
            (book) => InWait(
              author: book['name_author'],
              titleBook: book['name_book'],
              urlImage: book['img_book'],
              yearBook: book['year_book'],
              onCancel: removeQueryBook,
              idBook: book['id'],
            ),
          )
          .toList());
      notifyListeners();
    }
  }

  void removeQueryBook(int idBook) async {
    try {
      final result = await MyConnection().removeQueryBook(userId, idBook);
      list.removeWhere((book) {
        final b = book as InWait;
        return book.idBook == idBook;
      });
      notifyListeners();
    } catch (e) {}
  }
}
