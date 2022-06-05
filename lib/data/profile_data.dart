import 'package:book_manager/connect_db.dart';
import 'package:flutter/material.dart';

class ProfileData extends ChangeNotifier {
  String name = '';
  String login = '';
  int id = 0;
  int countBookWantRead = 0;

  void init(NameAndLogin data) {
    name = data.name;
    login = data.login;
    id = data.id;
    initCountBookWantRead();
  }

  Future<void> initCountBookWantRead() async {
    final result = await MyConnection().getCountBookWantRead(id);
    if (result != null) {
      countBookWantRead = result.first['count_book'];
      notifyListeners();
    }
  }
}
