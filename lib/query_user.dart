import 'dart:ui';

import 'package:flutter/material.dart';

class MyQuery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 22,
                left: 27,
                right: 27,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Color.fromRGBO(76, 61, 255, 1),
                  ),
                  Expanded(
                    child: Text(
                      'Мои запросы',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  constraints: const BoxConstraints(maxHeight: double.infinity),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(228, 228, 228, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Align(
                    child: Text(
                      'Вы читаете',
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
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 30,
                  constraints: const BoxConstraints(maxHeight: double.infinity),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(228, 228, 228, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Align(
                    child: Text(
                      'В ожидании',
                      style: TextStyle(
                        color: Color.fromRGBO(124, 124, 124, 1),
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 30,
                  constraints: const BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(228, 228, 228, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    child: Row(
                      children: const [
                        Icon(
                          Icons.restore_rounded,
                          color: Color.fromRGBO(124, 124, 124, 1),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'История',
                          style: TextStyle(
                            color: Color.fromRGBO(124, 124, 124, 1),
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 130,
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
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 65,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 10,
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                              ),
                            ],
                            image: const DecorationImage(
                                image: NetworkImage(
                                  "https://img4.labirint.ru/rc/009ddcb31237552314703a6847875d04/220x340/books34/335480/cover.png?1612704312",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Голодные игры. И вспыхнет пламя. Сойка-пересмешница',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromRGBO(70, 70, 70, 1),
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Сьюзен Коллинз, 2009',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromRGBO(196, 196, 196, 1),
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
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
                                      width: 10,
                                    ),
                                    RichText(
                                      text: const TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Осталось\n',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  124, 124, 124, 1),
                                              fontFamily: 'Roboto',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '6 д 21 ч',
                                            style: TextStyle(
                                              color:
                                                  Color.fromRGBO(70, 70, 70, 1),
                                              fontFamily: 'Roboto',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 48,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: double.infinity),
                                            height: 30,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 26),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Color.fromRGBO(
                                                    76, 61, 255, 1),
                                              ),
                                            ),
                                            child: const Align(
                                              child: Text(
                                                'Вернуть',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      76, 61, 255, 1),
                                                  fontFamily: 'Roboto',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                ),
                                              ),
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
