import 'dart:ui';

import 'package:flutter/material.dart';

class Elect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Color.fromRGBO(76, 61, 255, 1),
                  ),
                  Text(
                    'Избранные',
                    style: TextStyle(
                      color: Color.fromRGBO(76, 61, 255, 1),
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Color.fromRGBO(76, 61, 255, 1),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
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
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 22.5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Icon(
                                    Icons.delete_forever,
                                    size: 18,
                                    color: Color.fromRGBO(227, 82, 82, 1),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 21.88,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
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
                                padding:
                                    const EdgeInsets.only(top: 10, left: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
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
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        'Сьюзен Коллинз, 2009',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(196, 196, 196, 1),
                                          fontFamily: 'Roboto',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
