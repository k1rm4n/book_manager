import 'package:flutter/material.dart';

class RegData extends ChangeNotifier {
  Color defTextColor = const Color.fromRGBO(89, 89, 89, 1);

  Color defBorder = const Color.fromRGBO(228, 228, 228, 1);

  void setRedTextAndBorder() {
    defTextColor = Colors.red;
    defBorder = Colors.red;
    notifyListeners();
  }

  void defColorTextAndBorder() {
    defBorder = const Color.fromRGBO(228, 228, 228, 1);
    defTextColor = const Color.fromRGBO(89, 89, 89, 1);
    notifyListeners();
  }

  double defSizedHeight = 10;

  void defSized() {
    defSizedHeight = 10;
    notifyListeners();
  }

  var rowPresetFirstName = Row(children: const []);

  void defRowPresetFirstName() {
    rowPresetFirstName = Row(children: const []);
    notifyListeners();
  }

  var rowPresetLastName = Row(
    children: const [],
  );

  void defRowPresetLastName() {
    rowPresetLastName = Row(children: const []);
    notifyListeners();
  }

  var rowPresetMail = Row(children: const []);

  void defRowPresetMail() {
    rowPresetMail = Row(children: const []);
    notifyListeners();
  }

  var rowPresetPass = Row(children: const []);

  void defRowPresetPass() {
    rowPresetPass = Row(children: const []);
    notifyListeners();
  }

  var rowPresetRepeatPass = Row(children: const []);

  void defRowPresetRepeatPass() {
    rowPresetRepeatPass = Row(children: const []);
    notifyListeners();
  }

  void setRowPresetLastName(String text) {
    rowPresetLastName = Row(
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 15,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.red,
          ),
        )
      ],
    );
    notifyListeners();
  }

  void setRowPresetFirstName(String text) {
    rowPresetFirstName = Row(
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 15,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.red,
          ),
        )
      ],
    );
    notifyListeners();
  }

  void setRowPresetMail(String text) {
    rowPresetMail = Row(
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 15,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          text,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.red,
          ),
        )),
      ],
    );
    notifyListeners();
  }

  void setRowPresetPass(String text) {
    rowPresetPass = Row(
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 15,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
    notifyListeners();
  }

  void setRowPresetRepeatPass(String text) {
    rowPresetRepeatPass = Row(
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 15,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.red,
          ),
        ),
      ],
    );
    notifyListeners();
  }

  void setSizedHeight() {
    defSizedHeight = 40;
    notifyListeners();
  }

  double defSizedHeightPass = 10;

  void setSizedHeightPass() {
    defSizedHeightPass = 80;
    notifyListeners();
  }

  void defSizedPass() {
    defSizedHeightPass = 10;
    notifyListeners();
  }
}
