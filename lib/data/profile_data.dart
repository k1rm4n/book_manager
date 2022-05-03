import 'package:flutter/material.dart';

class ProfileData extends ChangeNotifier {
  String name = '';

  void setName(String value) {
    name = value;
  }
}
