import 'package:book_manager/connect_db.dart';
import 'package:flutter/material.dart';

import '../profile_user.dart';

class ProfileData extends ChangeNotifier {
  String name = '';
  String login = '';
  int id = 0;
  int countBookWantRead = 0;
  final listReadBook = <ImageReadBook>[];

  void init(NameAndLogin data) {
    name = data.name;
    login = data.login;
    id = data.id;
    initCountBookWantRead();
    initListBookRead();
  }

  Future<void> initCountBookWantRead() async {
    final result = await MyConnection().getCountBookWantRead(id);
    if (result != null) {
      countBookWantRead = result.first['count_book'];
      notifyListeners();
    }
  }

  initListBookRead() async {
    listReadBook.clear();
    final result = await MyConnection().getImageReadBook(id);
    if (result != null) {
      listReadBook.addAll(result
          .map((imageBook) => ImageReadBook(urlImage: imageBook['img_book']))
          .toList());
      notifyListeners();
    }
  }
}
