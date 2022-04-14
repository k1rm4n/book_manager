// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class Autorization extends StatelessWidget {
  final Shader linearGradient = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        Color.fromRGBO(103, 152, 230, 1),
        Color.fromRGBO(76, 61, 255, 1),
      ],
      stops: [
        0.4,
        0.8
      ]).createShader(const Rect.fromLTWH(65, 302, 245, 62));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(".dart_tool/images/book.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: 160,
                      height: 70,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'BOOK\n',
                              style: TextStyle(
                                foreground: Paint()..shader = linearGradient,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Roboto',
                                letterSpacing: 20,
                              ),
                            ),
                            TextSpan(
                              text: 'MANAGER',
                              style: TextStyle(
                                foreground: Paint()..shader = linearGradient,
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Roboto",
                      ),
                      decoration: InputDecoration(
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
                            borderSide:
                                BorderSide(color: Color(0xFFE4E4E4), width: 1)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Color(0xFFE4E4E4), width: 1),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Color(0xFFE4E4E4), width: 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextField(
                      obscureText: true,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Roboto",
                      ),
                      decoration: InputDecoration(
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
                            borderSide:
                                BorderSide(color: Color(0xFFE4E4E4), width: 1)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Color(0xFFE4E4E4), width: 1),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Color(0xFFE4E4E4), width: 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RichText(
                      text: const TextSpan(
                        text: 'Забыли пароль?',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Color.fromRGBO(89, 89, 89, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/profile');
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
                            text: 'Войти',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Новый пользователь? ',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Color(0xFF464646),
                              fontFamily: 'Roboto',
                            ),
                          ),
                          TextSpan(
                              text: 'Зарегестрироваться',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color.fromRGBO(61, 104, 255, 1),
                                fontFamily: 'Roboto',
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.popAndPushNamed(context, '/reg');
                                }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ), // Кнопка "Войти"
          ],
        ),
      ),
    );
  }
}
