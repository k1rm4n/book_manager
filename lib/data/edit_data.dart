import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../admin/library_admin.dart';
import '../connect_db.dart';

class EditData extends ChangeNotifier {
  List<Widget> list = [];

  void getLibrary() async {
    list.clear();
    final result = await MyConnection().getBookDataForEdit();
    if (result != null) {
      list.addAll(result
          .map(
            (book) => BookContainerWidget(
              bookId: book['id'],
              author: book['name_author'],
              titleBook: book['name_book'],
              yearBook: book['year_book'],
            ),
          )
          .toList());
    }
    notifyListeners();
  }

  void getIdLibrary(int bookId) async {
    list.clear();
    final result = await MyConnection().getBookForId(bookId);
    if (result != null) {
      list.addAll(result
          .map(
            (book) => BookContainerWidget(
              bookId: book['id'],
              author: book['name_author'],
              titleBook: book['name_book'],
              yearBook: book['year_book'],
            ),
          )
          .toList());
    }
    notifyListeners();
  }
}
