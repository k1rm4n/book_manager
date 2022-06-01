import 'package:book_manager/connect_db.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class AddBookAdmin extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context, '/libraryAdmin');
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Color.fromRGBO(76, 61, 255, 1),
                        ),
                      ),
                      const Expanded(
                        child: Align(
                          child: Text(
                            'Добавление книги',
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
                  const SizedBox(height: 20),
                  _SaveDataButtonWidget(mapContollers: {
                    "nameAuthor": _nameAuthor,
                    "nameBook": _nameBook,
                    "limitAge": _limitAge,
                    "categoryBook": _categoryBook,
                    "publicBook": _publicBook,
                    "yearBook": _yearBook,
                    "descriptionBook": _descriptionBook,
                    "contentBook": _contentBook,
                    "imgBook": _imgBook,
                    "imgAuthor": _imgAuthor,
                    "countBook": _countBook,
                    "pagesBook": _pagesBook,
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SaveDataButtonWidget extends StatefulWidget {
  _SaveDataButtonWidget({
    Key? key,
    required this.mapContollers,
  }) : super(key: key);

  final Map<String, TextEditingController> mapContollers;
  @override
  State<_SaveDataButtonWidget> createState() => _SaveDataButtonWidgetState();
}

class _SaveDataButtonWidgetState extends State<_SaveDataButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          bool stateController = false;
          widget.mapContollers.forEach((key, value) {
            if (value.text.isEmpty) {
              stateController = true;
            }
          });
          if (stateController) {
            print('Поля пустые');
          } else {
            MyConnection().printLibraryData(
              widget.mapContollers["nameAuthor"]!.text,
              widget.mapContollers["nameBook"]!.text,
              widget.mapContollers["limitAge"]!.text,
              widget.mapContollers["categoryBook"]!.text,
              widget.mapContollers["publicBook"]!.text,
              widget.mapContollers["yearBook"]!.text,
              widget.mapContollers["descriptionBook"]!.text,
              widget.mapContollers["contentBook"]!.text,
              widget.mapContollers["imgBook"]!.text,
              widget.mapContollers["imgAuthor"]!.text,
              widget.mapContollers["countBook"]!.text,
              widget.mapContollers["pagesBook"]!.text,
              context,
            );
            widget.mapContollers.forEach((key, value) {
              value.text = '';
            });
          }
        });
      },
      child: Padding(
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
              child: Text(
                'Сохранить',
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
