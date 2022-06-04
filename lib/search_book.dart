import 'package:flutter/material.dart';

import 'connect_db.dart';
import 'library_list.dart';
import 'library_list_data.dart';

class SearchBook extends StatefulWidget {
  const SearchBook({Key? key}) : super(key: key);

  @override
  State<SearchBook> createState() => _SearchBookState();
}

class _SearchBookState extends State<SearchBook> {
  final listBook = <BookListWidget>[];
  late final int userId;
  bool hasInit = false;

  void searchListBook(String? textSearch) async {
    listBook.clear();
    final result = await MyConnection().getBookData(
      userId,
      where: ''' WHERE b.name_author like '%$textSearch%' OR b.name_book like
          '%$textSearch%' ''',
    );
    setState(() {
      if (result != null) {
        final libraryListData = result
            .map((book) => LibraryListData(
                  book["id"],
                  book["name_author"],
                  book["name_book"],
                  book["limit_age"],
                  book["category"],
                  book["public_book"],
                  book["year_book"],
                  book["description_book"],
                  book["content_book"],
                  book["img_book"],
                  book["img_author"],
                  book["count_book"],
                  book["pages_book"],
                  book["like_state"],
                  userId,
                  book["query_book"],
                ))
            .toList();
        listBook.addAll(
          libraryListData
              .map((libraryData) => BookListWidget(
                    book: libraryData,
                  ))
              .toList(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!hasInit) {
      final args = ModalRoute.of(context)!.settings.arguments as NameAndLogin;
      userId = args.id;
      hasInit = !hasInit;
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, '/library');
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color.fromRGBO(76, 61, 255, 1),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'Поиск',
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
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(244, 244, 244, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onSubmitted: searchListBook,
                  textAlignVertical: TextAlignVertical.center,
                  controller: TextEditingController(),
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'название или автор',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(124, 124, 124, 1),
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                    ),
                    prefixIcon: Icon(Icons.search),
                    isCollapsed: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: listBook.length,
                itemBuilder: (BuildContext context, int index) {
                  return listBook[index];
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
