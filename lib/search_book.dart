import 'package:flutter/material.dart';

class SearchBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, '/library');
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color.fromRGBO(76, 61, 255, 1),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'Поиск',
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
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(244, 244, 244, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: TextEditingController(),
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'название или автор',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(124, 124, 124, 1),
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                    ),
                    prefixIcon: Icon(Icons.search),
                    isCollapsed: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Жанры',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 2,
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Биология',
                      style: TextStyle(
                        color: Color.fromRGBO(70, 70, 70, 1),
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
