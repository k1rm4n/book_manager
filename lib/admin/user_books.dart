import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class UserBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        child: Column(
          children: const [
            _PremiserHeaderWidget(),
            SizedBox(
              height: 30,
            ),
            _BookContainerWidget(),
          ],
        ),
      )),
    );
  }
}

class _BookContainerWidget extends StatelessWidget {
  const _BookContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            offset: Offset(0, 0),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              width: 81,
              height: 125,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 4),
                    blurRadius: 10,
                  ),
                ],
                image: DecorationImage(
                    image: NetworkImage(
                      'book.imgBook',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 14, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            'book.nameBook',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Color.fromRGBO(70, 70, 70, 1),
                              fontSize: 15,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '{book.nameAuthor}, {book.yearBook}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PremiserHeaderWidget extends StatelessWidget {
  const _PremiserHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context, '/navBarAdmin'),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color.fromRGBO(76, 61, 255, 1),
          ),
        ),
        const Expanded(
            child: Text(
          'Задолженность',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(76, 61, 255, 1),
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
          ),
        )),
      ],
    );
  }
}
