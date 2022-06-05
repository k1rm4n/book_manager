import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../admin/query_admin.dart';
import '../connect_db.dart';

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

  Future<void> getQueryBook() async {
    final result = await MyConnection().getAllWaitBook();
    if (result != null) {
      list.clear();
      list.addAll(result
          .map((readers) => ListItemWidget(
                author: readers['name_author'],
                firstName: readers['firstname'],
                id: readers['id'],
                lastName: readers['lastname'],
                returnBook: 0,
                titleBook: readers['name_book'],
                yearBook: readers['year_book'],
                bookId: readers['book_id'],
                userId: readers['user_id'],
              ))
          .toList());
      notifyListeners();
    }
  }

  Future<void> acceptBook(int userId, int bookId) async {
    try {
      final result = await MyConnection().acceptBook(userId, bookId);
      list.removeWhere(
        (book) {
          final b = book as ListItemWidget;
          return b.userId == userId && b.bookId == bookId;
        },
      );
      notifyListeners();
    } catch (e) {}
  }

  Future<void> getReturnBook() async {
    final result = await MyConnection().getAllReturnBook();
    if (result != null) {
      list.clear();
      list.addAll(result
          .map((readers) => ListItemWidget(
                author: readers['name_author'],
                firstName: readers['firstname'],
                id: readers['id'],
                lastName: readers['lastname'],
                returnBook: 1,
                titleBook: readers['name_book'],
                yearBook: readers['year_book'],
                bookId: readers['book_id'],
                userId: readers['user_id'],
              ))
          .toList());
      notifyListeners();
    }
  }
}
