import 'package:book_manager/connect_db.dart';
import 'package:book_manager/data/query_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassUserAndBookID {
  int userId = 0;
  int bookId = 0;
  ClassUserAndBookID(this.userId, this.bookId);
}

void onTap(int userId, int bookId, BuildContext context) async {
  await Navigator.pushNamed(context, '/welcomQueryAdmin',
      arguments: ClassUserAndBookID(userId, bookId));
  Provider.of<QueryData>(context, listen: false).getQueryBook();
}

class QueryAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final queryData = QueryData();
    queryData.getQueryBook();
    queryData.activeColorQueryBook();
    return ChangeNotifierProvider(
      create: (context) => queryData,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 25),
                  child: Text(
                    'Запросы',
                    style: TextStyle(
                      color: Color.fromRGBO(76, 61, 255, 1),
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    _QueryBookButtonWidget(),
                    SizedBox(
                      width: 15,
                    ),
                    _ReturnBookButtonWidget(),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const _BooksListViewWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BooksListViewWidget extends StatelessWidget {
  const _BooksListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) =>
          Provider.of<QueryData>(context).list[index],
      itemCount: Provider.of<QueryData>(context).list.length,
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final int id;
  final int returnBook;
  final String titleBook;
  final String author;
  final String yearBook;
  final String lastName;
  final String firstName;
  final int userId;
  final int bookId;

  const ListItemWidget({
    Key? key,
    required this.returnBook,
    required this.id,
    required this.titleBook,
    required this.author,
    required this.yearBook,
    required this.lastName,
    required this.firstName,
    required this.userId,
    required this.bookId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
          maxHeight: 104,
        ),
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
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            'ID${id.toString()}',
                            style: const TextStyle(
                              color: Color.fromRGBO(196, 196, 196, 1),
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        FittedBox(
                          child: Text(
                            titleBook,
                            style: const TextStyle(
                              color: Color.fromRGBO(70, 70, 70, 1),
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            '$author, $yearBook',
                            style: const TextStyle(
                              color: Color.fromRGBO(196, 196, 196, 1),
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: returnBook == 0
                                          ? 'Запросил: '
                                          : 'Вернул: ',
                                      style: const TextStyle(
                                        color: Color.fromRGBO(196, 196, 196, 1),
                                        fontFamily: 'Roboto',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '$firstName $lastName',
                                      style: const TextStyle(
                                        color: Color.fromRGBO(61, 104, 255, 1),
                                        fontFamily: 'Roboto',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                returnBook == 0
                                    ? onTap(userId, bookId, context)
                                    : Provider.of<QueryData>(context,
                                            listen: false)
                                        .acceptBook(userId, bookId);
                              },
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    boxShadow: const [
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
                                        returnBook == 1
                                            ? const Color.fromARGB(
                                                255, 125, 3, 3)
                                            : const Color.fromARGB(
                                                255, 33, 162, 24),
                                        returnBook == 1
                                            ? const Color.fromARGB(
                                                255, 185, 42, 42)
                                            : const Color.fromARGB(
                                                255, 112, 230, 103),
                                      ],
                                    ),
                                  ),
                                  child: Icon(
                                    returnBook == 1
                                        ? Icons.close_rounded
                                        : Icons.check_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReturnBookButtonWidget extends StatelessWidget {
  const _ReturnBookButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Provider.of<QueryData>(context, listen: false).defQueryBook();
          Provider.of<QueryData>(context, listen: false)
              .activeColorReturnBook();
          Provider.of<QueryData>(context, listen: false).getReturnBook();
        },
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: double.infinity,
            maxHeight: 30,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromRGBO(228, 228, 228, 1),
            ),
          ),
          child: Align(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                'Возврат книг',
                style: TextStyle(
                  color: Provider.of<QueryData>(context).defColorReturnBook,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _QueryBookButtonWidget extends StatelessWidget {
  const _QueryBookButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Provider.of<QueryData>(context, listen: false)
          //     .clearAndAddAll(const ListItemWidget(
          //   returnBook: 0,
          // ));
          Provider.of<QueryData>(context, listen: false).defReturnBook();
          Provider.of<QueryData>(context, listen: false).activeColorQueryBook();
          Provider.of<QueryData>(context, listen: false).getQueryBook();
        },
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: double.infinity,
            maxHeight: 30,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromRGBO(228, 228, 228, 1),
            ),
          ),
          child: Align(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                'Запрос книг',
                style: TextStyle(
                  color: Provider.of<QueryData>(context).defColorQueryBook,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
