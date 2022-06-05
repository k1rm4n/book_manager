import 'package:book_manager/admin/query_admin.dart';
import 'package:book_manager/connect_db.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class WelcomQueryAdmin extends StatelessWidget {
  int userId = 0;
  int bookId = 0;
  final _firstDate = TextEditingController();
  final _secondDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ClassUserAndBookID;
    userId = args.userId;
    bookId = args.bookId;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, '/queryAdmin');
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Color.fromRGBO(76, 61, 255, 1),
                  ),
                ),
                const Expanded(
                  child: Align(
                    child: Text(
                      'Одобрение запроса',
                      style: TextStyle(
                        color: Color.fromRGBO(76, 61, 255, 1),
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextField(
                      controller: _firstDate,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Roboto",
                      ),
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Дата выдачи',
                        contentPadding: EdgeInsets.symmetric(horizontal: 30),
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(70, 70, 70, 1),
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(228, 228, 228, 1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(228, 228, 228, 1),
                              width: 1),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(228, 228, 228, 1),
                              width: 1),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextField(
                      controller: _secondDate,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Roboto",
                      ),
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Дата возврата',
                        contentPadding: EdgeInsets.symmetric(horizontal: 30),
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(70, 70, 70, 1),
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(228, 228, 228, 1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(228, 228, 228, 1),
                              width: 1),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(228, 228, 228, 1),
                              width: 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _WelcomButtonWidget(
              userId: userId,
              bookId: bookId,
              firstDate: _firstDate,
              secondDate: _secondDate,
            ),
            SizedBox(height: 10),
            _NoButtonWidget(
              userId: userId,
              bookId: bookId,
            ),
          ],
        ),
      )),
    );
  }
}

class _NoButtonWidget extends StatelessWidget {
  int userId;
  int bookId;
  _NoButtonWidget({
    required this.userId,
    required this.bookId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MyConnection().deleteFromQuery(userId, bookId);
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromRGBO(76, 61, 230, 1),
            )),
        child: Align(
          child: RichText(
            text: const TextSpan(
              text: 'Отклонить запрос',
              style: TextStyle(
                color: Color.fromRGBO(76, 61, 230, 1),
                fontSize: 15,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _WelcomButtonWidget extends StatelessWidget {
  int userId;
  int bookId;
  TextEditingController firstDate;
  TextEditingController secondDate;

  _WelcomButtonWidget({
    required this.userId,
    required this.bookId,
    required this.firstDate,
    required this.secondDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await MyConnection().deleteFromQuery(userId, bookId);
        await MyConnection()
            .insertFromQuery(userId, bookId, firstDate.text, secondDate.text);
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
        child: Align(
          child: RichText(
            text: const TextSpan(
              text: 'Одобрить запрос',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
