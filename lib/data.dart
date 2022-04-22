import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataText extends ChangeNotifier {
  DataText(this.text);
  String text = 'E-mail';
  void setText(String text) {
    Text(
      text,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 20,
      ),
    );
    this.text = text;
    notifyListeners();
  }
}
