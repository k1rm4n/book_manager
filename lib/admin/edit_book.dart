import 'package:book_manager/connect_db.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

import 'library_admin.dart';

class EditBook extends StatelessWidget {
  int _bookId = 0;
  final _nameAuthor = TextEditingController();
  final _nameBook = TextEditingController();
  final _limitAge = TextEditingController();
  final _categoryBook = TextEditingController();
  final _publicBook = TextEditingController();
  final _yearBook = TextEditingController();
  final _descriptionBook = TextEditingController();
  final _contentBook = TextEditingController();
  final _imgBook = TextEditingController();
  final _imgAuthor = TextEditingController();
  final _countBook = TextEditingController();
  final _pagesBook = TextEditingController();

  void init() async {
    final result = await MyConnection().getBookForId(_bookId);
    _nameAuthor.text = result?.first['name_author'];
    _nameBook.text = result?.first['name_book'];
    _limitAge.text = result?.first['limit_age'].toString() ?? '';
    _categoryBook.text = result?.first['category'];
    _publicBook.text = result?.first['public_book'];
    _yearBook.text = result?.first['year_book'];
    _descriptionBook.text = result?.first['description_book'];
    _contentBook.text = result?.first['content_book'];
    _imgBook.text = result?.first['img_book'];
    _imgAuthor.text = result?.first['img_author'];
    _countBook.text = result?.first['count_book'].toString() ?? '';
    _pagesBook.text = result?.first['pages_book'].toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as int;
    _bookId = args;
    init();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const _HeaderEditBookWidget(),
                const SizedBox(
                  height: 30,
                ),
                _TextFieldWidget(
                  nameLabel: 'Автор',
                  controllerBook: _nameAuthor,
                ),
                _TextFieldWidget(
                  nameLabel: 'Название книги',
                  controllerBook: _nameBook,
                ),
                _TextFieldWidget(
                  nameLabel: 'Возрастное ограничение',
                  controllerBook: _limitAge,
                ),
                _TextFieldWidget(
                  nameLabel: 'Жанр',
                  controllerBook: _categoryBook,
                ),
                _TextFieldWidget(
                  nameLabel: 'Издательство',
                  controllerBook: _publicBook,
                ),
                _TextFieldWidget(
                  nameLabel: 'Год',
                  controllerBook: _yearBook,
                ),
                _TextFieldWidget(
                  nameLabel: 'Описание книги',
                  controllerBook: _descriptionBook,
                ),
                _TextFieldWidget(
                  nameLabel: 'Сожеражние книги',
                  controllerBook: _contentBook,
                ),
                _TextFieldWidget(
                  nameLabel: 'URL-ссылка книги',
                  controllerBook: _imgBook,
                ),
                _TextFieldWidget(
                  nameLabel: 'URL-ссылка автора',
                  controllerBook: _imgAuthor,
                ),
                _TextFieldWidget(
                  nameLabel: 'Кол-во книг',
                  controllerBook: _countBook,
                ),
                _TextFieldWidget(
                  nameLabel: 'Кол-во страниц',
                  controllerBook: _pagesBook,
                ),
                _EditButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EditButtonWidget extends StatelessWidget {
  const _EditButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
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
            child: FittedBox(
              child: Text(
                'Редактировать',
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
        ),
      ),
    );
  }
}

class _HeaderEditBookWidget extends StatelessWidget {
  const _HeaderEditBookWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context, '/navBarAdmin');
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color.fromRGBO(76, 61, 255, 1),
          ),
        ),
        const Expanded(
          child: Text(
            'Редактирование книги',
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
    );
  }
}

class _TextFieldWidget extends StatelessWidget {
  const _TextFieldWidget(
      {Key? key, required this.controllerBook, required this.nameLabel})
      : super(key: key);

  final TextEditingController controllerBook;

  final String nameLabel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: TextField(
            controller: controllerBook,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              fontFamily: "Roboto",
            ),
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: nameLabel,
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              labelStyle: const TextStyle(
                color: Color.fromRGBO(70, 70, 70, 1),
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Color.fromRGBO(228, 228, 228, 1),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    color: Color.fromRGBO(228, 228, 228, 1), width: 1),
              ),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    color: Color.fromRGBO(228, 228, 228, 1), width: 1),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
