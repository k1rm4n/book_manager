import 'dart:ui';

import 'package:book_manager/library_list_data.dart';
import 'package:flutter/material.dart';

class BookInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)!.settings.arguments as LibraryListData;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 260,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            book.imgBook,
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                        child: Container(
                          alignment: Alignment.center,
                          color: const Color.fromRGBO(0, 0, 0, 0.25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context, '/navBar');
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                        const Icon(
                          Icons.favorite_outline,
                          color: Color.fromRGBO(196, 196, 196, 1),
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      book.nameBook,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Автор:\n',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: book.nameAuthor,
                            style: const TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 130,
                          height: 201,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 10,
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                              ),
                            ],
                            image: DecorationImage(
                                image: NetworkImage(
                                  book.imgBook,
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Год ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(124, 124, 124, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '${book.yearBook}    • ${book.limitAge}+',
                                    style: const TextStyle(
                                      color: Color.fromRGBO(70, 70, 70, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Издательство ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(124, 124, 124, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: book.publicBook,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(70, 70, 70, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Инвентарный номер ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(124, 124, 124, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '№${book.idBook.toString()}',
                                    style: const TextStyle(
                                      color: Color.fromRGBO(70, 70, 70, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Страницы ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(124, 124, 124, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: book.pagesBook.toString(),
                                    style: const TextStyle(
                                      color: Color.fromRGBO(70, 70, 70, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                          height: 15,
                          child: Image.asset(
                            "images/time_data.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Срок сдачи ',
                                style: TextStyle(
                                  color: Color.fromRGBO(124, 124, 124, 1),
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: '3 недели',
                                style: TextStyle(
                                  color: Color.fromRGBO(70, 70, 70, 1),
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromRGBO(76, 61, 255, 1),
                          width: 1,
                        ),
                      ),
                      child: const Align(
                        child: Text(
                          'Запросить',
                          style: TextStyle(
                            color: Color.fromRGBO(76, 61, 255, 1),
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      book.descriptionBook,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color.fromRGBO(124, 124, 124, 1),
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Содержание',
                      style: TextStyle(
                        color: Color.fromRGBO(70, 70, 70, 1),
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      book.contentBook,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color.fromRGBO(124, 124, 124, 1),
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                  book.imgAuthor,
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: SizedBox(
                            height: 45,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    book.nameAuthor,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(61, 104, 255, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    '${book.countBook} книг',
                                    style: const TextStyle(
                                      color: Color.fromRGBO(124, 124, 124, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
