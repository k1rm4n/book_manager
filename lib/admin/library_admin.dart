import 'package:flutter/material.dart';

class LibraryAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  _BookContainerWidget(),
                ],
              ),
            ),
            _AddBookWidget(),
          ],
        ),
      ),
    );
  }
}

class _BookContainerWidget extends StatelessWidget {
  const _BookContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/editBookAdmin');
      },
      child: Container(
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
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Container(
                width: 20,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(244, 244, 244, 1),
                  border: Border(
                    right: BorderSide(
                      color: Color.fromRGBO(228, 228, 228, 1),
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                child: const Align(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      '1',
                      style: TextStyle(
                          color: Color.fromRGBO(61, 104, 255, 1),
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: FittedBox(
                fit: BoxFit.cover,
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Записки о Шерлоке Холмсе\n',
                        style: TextStyle(
                          color: Color.fromRGBO(70, 70, 70, 1),
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: 'Сэр Артутр Конан Дойл, 2019',
                        style: TextStyle(
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
            const Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
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
        children: [
          const Expanded(
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
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/searchBook');
            },
            child: const Icon(
              Icons.search,
              color: Color.fromRGBO(76, 61, 255, 1),
              size: 25,
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
      onTap: () => Navigator.pushNamed(context, '/addBookAdmin'),
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
