import 'package:flutter/material.dart';

class ProfileData extends ChangeNotifier {
  String name = '';

  ProfileData(this.name);
  String nameUser = 'null';
  void setNameUser(String name) {
    nameUser = name;
    notifyListeners();
  }
}
