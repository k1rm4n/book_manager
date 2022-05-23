// ignore_for_file: deprecated_member_use

import 'package:book_manager/connect_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class Registration extends StatelessWidget {
  final _lastname = TextEditingController();
  final _firstname = TextEditingController();
  final _mail = TextEditingController();
  final _pass = TextEditingController();
  final _repeatPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/auto');
                    },
                    child: Container(
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color.fromRGBO(61, 104, 255, 1),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Регистрация',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(61, 104, 255, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 117,
                  ),
                  _LastNameTextFieldWidget(lastname: _lastname),
                  const SizedBox(
                    height: 10,
                  ),
                  _FirstNameTextFieldWidget(firstname: _firstname),
                  const SizedBox(
                    height: 10,
                  ),
                  _MailTextFieldWidget(mail: _mail),
                  const SizedBox(
                    height: 10,
                  ),
                  _PassTextFieldWidget(pass: _pass),
                  const SizedBox(
                    height: 10,
                  ),
                  _RepeatPassTextFieldWidget(repeatPass: _repeatPass),
                  const SizedBox(
                    height: 68,
                  ),
                  // Кнопка "Зарегестрироваться"
                  _RegButtonWidget(
                    lastname: _lastname,
                    firstname: _firstname,
                    mail: _mail,
                    pass: _pass,
                    repeatPass: _repeatPass,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegButtonWidget extends StatefulWidget {
  _RegButtonWidget({
    Key? key,
    required TextEditingController lastname,
    required TextEditingController firstname,
    required TextEditingController mail,
    required TextEditingController pass,
    required TextEditingController repeatPass,
  })  : _lastname = lastname,
        _firstname = firstname,
        _mail = mail,
        _pass = pass,
        _repeatPass = repeatPass,
        super(key: key);

  final TextEditingController _lastname;
  final TextEditingController _firstname;
  final TextEditingController _mail;
  final TextEditingController _pass;
  final TextEditingController _repeatPass;

  @override
  State<_RegButtonWidget> createState() =>
      _RegButtonWidgetState(_lastname, _firstname, _mail, _pass, _repeatPass);
}

class _RegButtonWidgetState extends State<_RegButtonWidget> {
  final TextEditingController _lastname;
  final TextEditingController _firstname;
  final TextEditingController _mail;
  final TextEditingController _pass;
  final TextEditingController _repeatPass;
  _RegButtonWidgetState(this._lastname, this._firstname, this._mail, this._pass,
      this._repeatPass);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          MyConnection().reg(_lastname.text, _firstname.text, _mail.text,
              _pass.text, _repeatPass.text);
        });
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              offset: Offset(0, 5),
              blurRadius: 8,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(103, 152, 230, 1),
              Color.fromRGBO(76, 61, 230, 1),
            ],
            stops: [0, 1],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
          child: RichText(
            text: const TextSpan(
              text: 'Зарегестрироваться',
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}

class _RepeatPassTextFieldWidget extends StatelessWidget {
  const _RepeatPassTextFieldWidget({
    Key? key,
    required TextEditingController repeatPass,
  })  : _repeatPass = repeatPass,
        super(key: key);

  final TextEditingController _repeatPass;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextField(
        controller: _repeatPass,
        obscureText: true,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          fontFamily: "Roboto",
        ),
        decoration: const InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Повторите пароль",
          contentPadding: EdgeInsets.symmetric(horizontal: 30),
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            color: Color(0xFF595959),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Color(0xFFE4E4E4), width: 1)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Color(0xFFE4E4E4), width: 1),
          ),
        ),
      ),
    );
  }
}

class _PassTextFieldWidget extends StatelessWidget {
  const _PassTextFieldWidget({
    Key? key,
    required TextEditingController pass,
  })  : _pass = pass,
        super(key: key);

  final TextEditingController _pass;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextField(
        controller: _pass,
        obscureText: true,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          fontFamily: "Roboto",
        ),
        decoration: const InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Пароль",
          contentPadding: EdgeInsets.symmetric(horizontal: 30),
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            color: Color(0xFF595959),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Color(0xFFE4E4E4), width: 1)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Color(0xFFE4E4E4), width: 1),
          ),
        ),
      ),
    );
  }
}

class _MailTextFieldWidget extends StatelessWidget {
  const _MailTextFieldWidget({
    Key? key,
    required TextEditingController mail,
  })  : _mail = mail,
        super(key: key);

  final TextEditingController _mail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextField(
        controller: _mail,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          fontFamily: "Roboto",
        ),
        decoration: const InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "E-mail",
          contentPadding: EdgeInsets.symmetric(horizontal: 30),
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
            color: Color(0xFF595959),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Color(0xFFE4E4E4), width: 1)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Color(0xFFE4E4E4), width: 1),
          ),
        ),
      ),
    );
  }
}

class _FirstNameTextFieldWidget extends StatelessWidget {
  const _FirstNameTextFieldWidget({
    Key? key,
    required TextEditingController firstname,
  })  : _firstname = firstname,
        super(key: key);

  final TextEditingController _firstname;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextField(
        controller: _firstname,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          fontFamily: "Roboto",
        ),
        decoration: const InputDecoration(
          labelText: 'Имя',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(horizontal: 30),
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
            color: Color(0xFF595959),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Color(0xFFE4E4E4), width: 1)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Color(0xFFE4E4E4), width: 1),
          ),
        ),
      ),
    );
  }
}

class _LastNameTextFieldWidget extends StatelessWidget {
  const _LastNameTextFieldWidget({
    Key? key,
    required TextEditingController lastname,
  })  : _lastname = lastname,
        super(key: key);

  final TextEditingController _lastname;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextField(
        controller: _lastname,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          fontFamily: "Roboto",
        ),
        decoration: const InputDecoration(
          labelText: 'Фамилия',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(horizontal: 30),
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
            color: Color(0xFF595959),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Color(0xFFE4E4E4), width: 1)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Color(0xFFE4E4E4), width: 1),
          ),
        ),
      ),
    );
  }
}
