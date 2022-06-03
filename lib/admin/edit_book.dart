import 'package:flutter/material.dart';

class EditBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                _HeaderEditBookWidget(),
                SizedBox(
                  height: 30,
                ),
                _TextFieldWidget(
                  nameLabel: 'Автор',
                ),
                _TextFieldWidget(
                  nameLabel: 'Название книги',
                ),
                _TextFieldWidget(
                  nameLabel: 'Возрастное ограничение',
                ),
                _TextFieldWidget(
                  nameLabel: 'Жанр',
                ),
                _TextFieldWidget(
                  nameLabel: 'Издательство',
                ),
                _TextFieldWidget(
                  nameLabel: 'Год',
                ),
                _TextFieldWidget(
                  nameLabel: 'Описание книги',
                ),
                _TextFieldWidget(
                  nameLabel: 'Сожеражние книги',
                ),
                _TextFieldWidget(
                  nameLabel: 'URL-ссылка изображения книги',
                ),
                _TextFieldWidget(
                  nameLabel: 'URL-ссылка изображения автора',
                ),
                _TextFieldWidget(
                  nameLabel: 'Кол-во книг',
                ),
                _TextFieldWidget(
                  nameLabel: 'Кол-во страниц',
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
  const _TextFieldWidget({Key? key, required this.nameLabel}) : super(key: key);

  // final TextEditingController controllerBook;
  final String nameLabel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: TextField(
            // controller: controllerBook,
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
