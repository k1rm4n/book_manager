import 'dart:ui';

import 'package:flutter/material.dart';

class BookInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 260,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://img4.labirint.ru/rc/009ddcb31237552314703a6847875d04/220x340/books34/335480/cover.png?1612704312",
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                        child: Container(
                          alignment: Alignment.center,
                          color: const Color.fromRGBO(0, 0, 0, 0.25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        Icon(
                          Icons.favorite_outline,
                          color: Color.fromRGBO(196, 196, 196, 1),
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Голодные игры. И вспыхнет пламя. Сойка-пересмешница',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Автор:\n',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: 'Сьюзен Коллинз',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 130,
                          height: 201,
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
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 90,
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Год ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(124, 124, 124, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '2009    • 16+',
                                    style: TextStyle(
                                      color: Color.fromRGBO(70, 70, 70, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Издательство ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(124, 124, 124, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '"АСТ"',
                                    style: TextStyle(
                                      color: Color.fromRGBO(70, 70, 70, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Инвентарный номер ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(124, 124, 124, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '№34156',
                                    style: TextStyle(
                                      color: Color.fromRGBO(70, 70, 70, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Страницы ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(124, 124, 124, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '416',
                                    style: TextStyle(
                                      color: Color.fromRGBO(70, 70, 70, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Подробнее',
                                  style: TextStyle(
                                    color: Color.fromRGBO(61, 104, 255, 1),
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Color.fromRGBO(61, 104, 255, 1),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
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
                          width: 9,
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Срок сдачи ',
                                style: TextStyle(
                                  color: Color.fromRGBO(124, 124, 124, 1),
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: '3 недели',
                                style: TextStyle(
                                  color: Color.fromRGBO(70, 70, 70, 1),
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromRGBO(76, 61, 255, 1),
                          width: 1,
                        ),
                      ),
                      child: const Align(
                        child: Text(
                          'Запросить',
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
                    const SizedBox(
                      height: 20,
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
