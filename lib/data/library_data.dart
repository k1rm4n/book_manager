import 'package:book_manager/connect_db.dart';

import '../library_list_data.dart';
import 'package:flutter/material.dart';

class LibraryData extends ChangeNotifier {
  final List<LibraryListData> libraryListData = <LibraryListData>[];

  void initListBook(int userId) async {
    libraryListData.clear();
    final books = await MyConnection().getBookData(userId);
    if (books != null) {
      libraryListData.addAll(books
          .map((book) => LibraryListData(
                book["id"],
                book["name_author"],
                book["name_book"],
                book["limit_age"],
                book["category"],
                book["public_book"],
                book["year_book"],
                book["description_book"],
                book["content_book"],
                book["img_book"],
                book["img_author"],
                book["count_book"],
                book["pages_book"],
                book["like_state"],
                userId,
                book["query_book"],
              ))
          .toList());
    }
    notifyListeners();
  }
}
