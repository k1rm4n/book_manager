import 'package:flutter/material.dart';

import 'connect_db.dart';

class Elect extends StatefulWidget {
  Elect({Key? key}) : super(key: key);

  @override
  State<Elect> createState() => _ElectState();
}

class _ElectState extends State<Elect> {
  final listFavoriteBook = <_BookFavorite>[];

  late final int userId;

  bool hasInit = false;

  void initFavoriteList() async {
    listFavoriteBook.clear();
    final result = await MyConnection().getFavorite(userId);
    setState(() {
      if (result != null) {
        listFavoriteBook.addAll(
          result
              .map((book) => _BookFavorite(
                    author: book['name_author'],
                    titleBook: book['name_book'],
                    urlImage: book['img_book'],
                    yearBook: book['year_book'],
                    bookId: book['id'],
                    onDelete: removeFavoriteBook,
                  ))
              .toList(),
        );
      }
    });
  }

  void removeFavoriteBook(int bookId) async {
    try {
      await MyConnection().removeFavorite(userId, bookId);
      listFavoriteBook.removeWhere((element) => element.bookId == bookId);
      setState(() {});
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    if (!hasInit) {
      final args = ModalRoute.of(context)!.settings.arguments as NameAndLogin;
      userId = args.id;
      hasInit = !hasInit;
      initFavoriteList();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  // Icon(
                  //   Icons.arrow_back_ios_rounded,
                  //   color: Color.fromRGBO(76, 61, 255, 1),
                  // ),
                  Expanded(
                    child: Text(
                      'Избранные',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(76, 61, 255, 1),
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  // Icon(
                  //   Icons.search,
                  //   color: Color.fromRGBO(76, 61, 255, 1),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...listFavoriteBook
          ],
        ),
      ),
    );
  }
}

class _BookFavorite extends StatelessWidget {
  final int bookId;
  final Function(int bookId) onDelete;
  final String urlImage;
  final String titleBook;
  final String author;
  final String yearBook;

  const _BookFavorite({
    Key? key,
    required this.bookId,
    required this.onDelete,
    required this.urlImage,
    required this.titleBook,
    required this.author,
    required this.yearBook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 2,
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                ),
              ],
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 22.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.delete_forever),
                            iconSize: 18,
                            color: const Color.fromRGBO(227, 82, 82, 1),
                            onPressed: () => onDelete(bookId),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 21.88,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 65,
                      height: 100,
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
                              urlImage,
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titleBook,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: const Color.fromRGBO(70, 70, 70, 1),
                                fontFamily: 'Roboto',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                '$author, $yearBook',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Color.fromRGBO(196, 196, 196, 1),
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
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
    );
  }
}
