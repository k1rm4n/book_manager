import 'dart:ui';

import 'package:flutter/material.dart';

class QueryAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color.fromRGBO(76, 61, 255, 1),
                      ),
                    ),
                    const Text(
                      'Запросы',
                      style: TextStyle(
                        color: Color.fromRGBO(76, 61, 255, 1),
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.search,
                        color: Color.fromRGBO(76, 61, 255, 1),
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
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
                      child: const Align(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            'Запрос книг',
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
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
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
                      child: const Align(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            'Возврат книг',
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
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
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
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'ID12341',
                                  style: TextStyle(
                                    color: Color.fromRGBO(196, 196, 196, 1),
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Записки о Шерлоке Холмсе',
                                  style: TextStyle(
                                    color: Color.fromRGBO(70, 70, 70, 1),
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Сэр Артур Конан Дойл, 2019',
                                  style: TextStyle(
                                    color: Color.fromRGBO(196, 196, 196, 1),
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Запросил: ',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  196, 196, 196, 1),
                                              fontFamily: 'Roboto',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Иванов Иван',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  61, 104, 255, 1),
                                              fontFamily: 'Roboto',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.popAndPushNamed(
                                            context, '/auto');
                                      },
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: const BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.2),
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
                                                Color.fromRGBO(76, 61, 255, 1),
                                                Color.fromRGBO(
                                                    103, 152, 230, 1),
                                              ],
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.arrow_forward_ios_rounded,
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
            ],
          ),
        ),
      ),
    );
  }
}
