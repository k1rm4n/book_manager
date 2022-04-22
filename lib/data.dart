import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataText extends ChangeNotifier {
  String text = 'E-mail';
  void setText(String text) {
    this.text = text;
    notifyListeners();
  }

  var textStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontFamily: "Inter",
    color: Color.fromRGBO(89, 89, 89, 1),
  );

  void setErorTextStyle() {
    textStyle = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: "Inter",
      color: Colors.red,
    );
    notifyListeners();
  }

  void setDefaultTextStyle() {
    textStyle = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: "Inter",
      color: Color.fromRGBO(89, 89, 89, 1),
    );
    notifyListeners();
  }
}
