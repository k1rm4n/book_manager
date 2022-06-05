import 'package:book_manager/connect_db.dart';
import 'package:book_manager/data/edit_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/library_data.dart';

class LibraryAdmin extends StatefulWidget {
  @override
  State<LibraryAdmin> createState() => _LibraryAdminState();
}

class _LibraryAdminState extends State<LibraryAdmin> {
  final editData = EditData();

  @override
  Widget build(BuildContext context) {
    editData.getLibrary();
    return ChangeNotifierProvider(
      create: (context) => editData,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: const [
                    _HeaderLibraryWidget(),
                    SizedBox(
                      height: 30,
                    ),
                    _ListBooksWidget(),
                  ],
                ),
              ),
              const _AddBookWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListBooksWidget extends StatelessWidget {
  const _ListBooksWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      itemBuilder: (context, index) =>
          Provider.of<EditData>(context).list[index],
      itemCount: Provider.of<EditData>(context).list.length,
    );
  }
}

class BookContainerWidget extends StatefulWidget {
  final int bookId;
  final String titleBook;
  final String author;
  final String yearBook;

  const BookContainerWidget({
    Key? key,
    required this.bookId,
    required this.titleBook,
    required this.author,
    required this.yearBook,
  }) : super(key: key);

  @override
  State<BookContainerWidget> createState() => _BookContainerWidgetState();
}

class _BookContainerWidgetState extends State<BookContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/editBookAdmin',
            arguments: widget.bookId);
      },
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: double.infinity,
              maxHeight: 52,
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${widget.titleBook}\n',
                            style: const TextStyle(
                              color: Color.fromRGBO(70, 70, 70, 1),
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          TextSpan(
                            text: '${widget.author}, ${widget.yearBook}',
                            style: const TextStyle(
                              color: Color.fromRGBO(196, 196, 196, 1),
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () async {
                        await MyConnection().deleteBook(widget.bookId);
                        Provider.of<EditData>(context, listen: false)
                            .getLibrary();
                      },
                      child: const Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          )
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(
            child: Text(
              'Библиотека',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(76, 61, 255, 1),
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddBookWidget extends StatelessWidget {
  const _AddBookWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.pushNamed(context, '/addBookAdmin');
        Provider.of<EditData>(context, listen: false).getLibrary();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromRGBO(76, 61, 255, 1),
                    ),
                  ),
                  child: const Align(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        'Добавить книгу',
                        style: TextStyle(
                          color: Color.fromRGBO(103, 152, 230, 1),
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
