import 'package:flutter/material.dart';

class AutoData extends ChangeNotifier {
  String nameUser = 'null';
  void setNameUser(String name) {
    nameUser = name;
    notifyListeners();
  }

  String textLogin = 'E-mail';
  void setText(String text) {
    textLogin = text;
    notifyListeners();
  }

  String textPass = 'Пароль';
  void setPassText(String text) {
    textPass = text;
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

  Color defBorder = const Color.fromRGBO(228, 228, 228, 1);

  void setRedColorBorder() {
    defBorder = Colors.red;
    notifyListeners();
  }

  void setDefColorBorder() {
    defBorder = const Color.fromRGBO(228, 228, 228, 1);
    notifyListeners();
  }
}
