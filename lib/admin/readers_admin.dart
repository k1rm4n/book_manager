import 'package:flutter/material.dart';

class ReadersAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
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
                      'Читатели',
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
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                    child: const Align(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          'Список читателей',
                          style: TextStyle(
                            color: Color.fromRGBO(76, 61, 255, 1),
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
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
                    child: const Align(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          'Список должников',
                          style: TextStyle(
                            color: Color.fromRGBO(124, 124, 124, 1),
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Иванов Иван\n',
                                style: TextStyle(
                                  color: Color.fromRGBO(70, 70, 70, 1),
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: '10 класс',
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
