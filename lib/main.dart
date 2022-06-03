// ignore_for_file: deprecated_member_use

import 'package:book_manager/admin/add_book_admin.dart';
import 'package:book_manager/admin/edit_book.dart';
import 'package:book_manager/admin/library_admin.dart';
import 'package:book_manager/admin/navigator_bar_admin.dart';
import 'package:book_manager/admin/query_admin.dart';
import 'package:book_manager/admin/readers_admin.dart';
import 'package:book_manager/admin/welcom_query.dart';
import 'package:book_manager/library_list.dart';
import 'package:book_manager/navigation_bar.dart';
import 'package:book_manager/profile_user.dart';
import 'package:book_manager/search_book.dart';
import 'package:flutter/material.dart';
import 'auto_user.dart';
import 'reg_user.dart';
import 'notifications_user.dart';
import 'settings_user.dart';
import 'book_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MainSreen(),
        '/auto': (BuildContext context) => Autorization(),
        '/reg': (BuildContext context) => Registration(),
        '/profile': (BuildContext context) => Profile(),
        '/notific': (BuildContext context) => Notifications(),
        '/settingsUser': (BuildContext context) => SettingsUser(),
        '/library': (BuildContext context) => Library(),
        '/navBar': (BuildContext context) => MainNavigationBar(),
        '/bookInfo': (BuildContext context) => BookInfo(),
        '/searchBook': (BuildContext context) => SearchBook(),
        '/addBookAdmin': (BuildContext context) => AddBookAdmin(),
        '/welcomQueryAdmin': (BuildContext context) => WelcomQueryAdmin(),
        '/navBarAdmin': (BuildContext context) => NavigatorBarAdmin(),
        '/editBookAdmin': (BuildContext context) => EditBook(),
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
    stops: [0, 0.86],
  ).createShader(const Rect.fromLTWH(65, 302, 245, 62));
  // arrow_forward_ios_rounded
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _TextWelcomWidget(linearGradient: linearGradient),
              const _ButtonNextWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonNextWidget extends StatelessWidget {
  const _ButtonNextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: GestureDetector(
        onTap: () {
          Navigator.popAndPushNamed(context, '/auto');
        },
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  offset: Offset(0, 4),
                  blurRadius: 10,
                  spreadRadius: 3,
                )
              ],
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Color.fromRGBO(76, 61, 255, 1),
                  Color.fromRGBO(103, 152, 230, 1),
                ],
              ),
            ),
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class _TextWelcomWidget extends StatelessWidget {
  const _TextWelcomWidget({
    Key? key,
    required this.linearGradient,
  }) : super(key: key);

  final Shader linearGradient;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 100,
      child: Align(
        alignment: Alignment.center,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Добро пожаловать в\n',
                style: TextStyle(
                  color: Color.fromRGBO(70, 70, 70, 1),
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Roboto',
                ),
              ),
              TextSpan(
                text: 'BookManager',
                style: TextStyle(
                  foreground: Paint()..shader = linearGradient,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
