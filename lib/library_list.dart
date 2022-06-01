import 'package:book_manager/connect_db.dart';
import 'package:book_manager/library_list_data.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:mysql1/mysql1.dart';
import 'package:provider/provider.dart';
import 'data/library_data.dart';
import 'navigation_bar.dart';

class Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final initList = LibraryData();
    initList.initListBook();
    return ChangeNotifierProvider(
        create: (context) => initList,
        builder: (context, widget) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const _HeaderLibraryWidget(),
                    const _GenreListWidget(),
                    const SizedBox(
                      height: 29,
                    ),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        padding: const EdgeInsets.all(8),
                        itemCount: Provider.of<LibraryData>(context)
                            .libraryListData
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          return _BookListWidget(index: index);
                        }),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class _BookListWidget extends StatefulWidget {
  const _BookListWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;
  @override
  State<_BookListWidget> createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<_BookListWidget> {
  late Color _likeColor;

  @override
  void initState() {
    _likeColor = const Color.fromRGBO(196, 196, 196, 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final book =
        Provider.of<LibraryData>(context).libraryListData[widget.index];

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/bookInfo', arguments: book);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    offset: Offset(0, 0),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: 81,
                      height: 125,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0, 4),
                            blurRadius: 10,
                          ),
                        ],
                        image: DecorationImage(
                            image: NetworkImage(
                              book.imgBook,
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 14, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Text(
                                    book.nameBook,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(70, 70, 70, 1),
                                      fontSize: 15,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 11),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: LikeButton(
                                    size: 30,
                                    circleColor: const CircleColor(
                                        start: Color.fromARGB(255, 255, 102, 0),
                                        end: Color.fromARGB(255, 204, 7, 0)),
                                    bubblesColor: const BubblesColor(
                                      dotPrimaryColor:
                                          Color.fromARGB(255, 255, 102, 0),
                                      dotSecondaryColor:
                                          Color.fromARGB(255, 204, 7, 0),
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.favorite_outline,
                                        color: isLiked //book.like == 1
                                            ? Colors.red
                                            : const Color.fromRGBO(
                                                196, 196, 196, 1),
                                      );
                                    },
                                    // onTap: (isLiked) {
                                    //   setState(() {
                                    //     book.like = book.like == 0 ? 1 : 0;
                                    //     MyConnection().updateIdBook(
                                    //         book.like, book.idBook);
                                    //   });
                                    //   return Future.value(!isLiked);
                                    // },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${book.nameAuthor}, ${book.yearBook}',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Color.fromRGBO(196, 196, 196, 1),
                            ),
                          ),
                          const SizedBox(),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      width: 5,
                                    ),
                                    const Expanded(
                                      child: Text(
                                        '3 недели',
                                        style: TextStyle(
                                          color: Color.fromRGBO(70, 70, 70, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      height: 30,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18, vertical: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 1,
                                          color: const Color.fromRGBO(
                                              76, 61, 255, 1),
                                        ),
                                      ),
                                      child: const FittedBox(
                                        child: Text(
                                          'Запросить',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(76, 61, 255, 1),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontFamily: 'Roboto',
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
                ],
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}

class _GenreListWidget extends StatelessWidget {
  const _GenreListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromRGBO(228, 228, 228, 1),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(228, 228, 228, 1),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Приключения',
                  style: TextStyle(
                    color: Color.fromRGBO(124, 124, 124, 1),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderLibraryWidget extends StatelessWidget {
  const _HeaderLibraryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            // onTap: () {
            //   MainNavigationBar();
            // },
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Color.fromRGBO(76, 61, 255, 1),
            ),
          ),
          const Text(
            'Библиотека',
            style: TextStyle(
              color: Color.fromRGBO(76, 61, 255, 1),
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/searchBook');
            },
            child: const Icon(
              Icons.search,
              color: Color.fromRGBO(76, 61, 255, 1),
            ),
          ),
        ],
      ),
    );
  }
}
