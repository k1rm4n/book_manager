import 'package:book_manager/library_list_data.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'navigation_bar.dart';

class Library extends StatelessWidget {
  final libraryListData = List<LibraryListData>;

  @override
  Widget build(BuildContext context) {
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
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/bookInfo');
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
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.25),
                                            offset: Offset(0, 4),
                                            blurRadius: 10,
                                          ),
                                        ],
                                        image: const DecorationImage(
                                            image: NetworkImage(
                                              "https://img4.labirint.ru/rc/009ddcb31237552314703a6847875d04/220x340/books34/335480/cover.png?1612704312",
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
                                      padding: const EdgeInsets.only(
                                          bottom: 14, right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Expanded(
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 16),
                                                  child: Text(
                                                    'Голодные игры. И вспыхнет пламя. Сойка-пересмешница',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          70, 70, 70, 1),
                                                      fontSize: 15,
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 11),
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: LikeButton(
                                                    size: 30,
                                                    circleColor:
                                                        const CircleColor(
                                                            start:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    102,
                                                                    0),
                                                            end: Color.fromARGB(
                                                                255,
                                                                204,
                                                                7,
                                                                0)),
                                                    bubblesColor:
                                                        const BubblesColor(
                                                      dotPrimaryColor:
                                                          Color.fromARGB(
                                                              255, 255, 102, 0),
                                                      dotSecondaryColor:
                                                          Color.fromARGB(
                                                              255, 204, 7, 0),
                                                    ),
                                                    likeBuilder: (isLiked) {
                                                      return Icon(
                                                        Icons.favorite_outline,
                                                        color: isLiked
                                                            ? Colors.red
                                                            : const Color
                                                                    .fromRGBO(
                                                                196,
                                                                196,
                                                                196,
                                                                1),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            'Сьюзен Коллинз, 2009',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  196, 196, 196, 1),
                                            ),
                                          ),
                                          const SizedBox(),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
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
                                                          color: Color.fromRGBO(
                                                              70, 70, 70, 1),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontFamily: 'Roboto',
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 100,
                                                      height: 30,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 18,
                                                          vertical: 8),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          width: 1,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              76, 61, 255, 1),
                                                        ),
                                                      ),
                                                      child: const FittedBox(
                                                        child: Text(
                                                          'Запросить',
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    76,
                                                                    61,
                                                                    255,
                                                                    1),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontFamily:
                                                                'Roboto',
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
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class _BookListWidget extends StatefulWidget {
  const _BookListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_BookListWidget> createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<_BookListWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/bookInfo');
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
                        image: const DecorationImage(
                            image: NetworkImage(
                              "https://img4.labirint.ru/rc/009ddcb31237552314703a6847875d04/220x340/books34/335480/cover.png?1612704312",
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
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text(
                                    'Голодные игры. И вспыхнет пламя. Сойка-пересмешница',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
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
                                    likeBuilder: (isLiked) {
                                      return Icon(
                                        Icons.favorite_outline,
                                        color: isLiked
                                            ? Colors.red
                                            : const Color.fromRGBO(
                                                196, 196, 196, 1),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Сьюзен Коллинз, 2009',
                            textAlign: TextAlign.left,
                            style: TextStyle(
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
