import 'dart:ui';
import 'package:book_manager/connect_db.dart';
import 'package:book_manager/library_list_data.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class BookInfo extends StatefulWidget {
  const BookInfo({Key? key}) : super(key: key);

  @override
  State<BookInfo> createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> {
  bool addHistory = false;
  late final LibraryListData book;

  @override
  void initState() {
    super.initState();
  }

  void addQuery() async {
    try {
      MyConnection().addQuery(book.idUser, book.idBook);

      setState(() {
        book.queryBook = 1;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    if (!addHistory) {
      book = ModalRoute.of(context)!.settings.arguments as LibraryListData;
      MyConnection().addHistory(book.idUser, book.idBook);
      addHistory = true;
    }
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
                    _HeaderBackAndLikeWidget(book: book),
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
                        const Icon(Icons.access_time, size: 20),
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
                    GestureDetector(
                      onTap: book.queryBook == 0 ? addQuery : null,
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: book.queryBook == 0
                                ? const Color.fromRGBO(76, 61, 255, 1)
                                : Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Align(
                          child: Text(
                            book.queryBook == 0 ? 'Запросить' : 'Запрошено',
                            style: const TextStyle(
                              color: Color.fromRGBO(76, 61, 255, 1),
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
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
                        SizedBox(
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

class _HeaderBackAndLikeWidget extends StatefulWidget {
  const _HeaderBackAndLikeWidget({
    Key? key,
    required this.book,
  }) : super(key: key);

  final LibraryListData book;

  @override
  State<_HeaderBackAndLikeWidget> createState() =>
      _HeaderBackAndLikeWidgetState();
}

class _HeaderBackAndLikeWidgetState extends State<_HeaderBackAndLikeWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
      ],
    );
  }
}
