// ignore_for_file: deprecated_member_use

import 'package:book_manager/profile_user.dart';
import 'package:flutter/material.dart';
import 'auto_user.dart';
import 'reg_user.dart';
import 'notifications_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MainSreen(),
        '/auto': (BuildContext context) => Autorization(),
        '/reg': (BuildContext context) => Registration(),
        '/profile': (BuildContext context) => Profile(),
        '/notific': (BuildContext context) => Notifications(),
      },
    );
  }
}

class MainSreen extends StatelessWidget {
  final Shader linearGradient = const LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
        Color.fromRGBO(76, 61, 255, 1),
        Color.fromRGBO(103, 152, 230, 1),
      ],
      stops: [
        0,
        0.86
      ]).createShader(const Rect.fromLTWH(65, 302, 245, 62));
  // arrow_forward_ios_rounded
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                              offset: Offset(0, 4),
                              blurRadius: 10,
                              spreadRadius: 3,
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(103, 152, 230, 1),
                              Color.fromRGBO(76, 61, 255, 1),
                            ],
                            stops: [0, 0.86],
                          ),
                          shape: BoxShape.circle),
                      child: FloatingActionButton(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        child: const Icon(Icons.arrow_forward_ios_rounded),
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/auto');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'Добро пожаловать в\n',
                        style: TextStyle(
                            color: Color.fromRGBO(70, 70, 70, 1),
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Roboto'),
                      ),
                      TextSpan(
                        text: 'BookManager',
                        style: TextStyle(
                          foreground: Paint()..shader = linearGradient,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
