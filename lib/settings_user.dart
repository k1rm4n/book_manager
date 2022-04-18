import 'package:flutter/material.dart';

class SettingsUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              _HeaderSettingsWidget(),
              const SizedBox(
                height: 30,
              ),
              _ContainerProfileAndExitWidget(),
              const SizedBox(
                height: 20,
              ),
              const _ContactWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContainerProfileAndExitWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 188,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(244, 244, 244, 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 2,
            color: Color.fromRGBO(0, 0, 0, 0.2),
          ),
        ],
      ),
      child: Column(
        children: [
          _BoxProfileWidget(),
          _ButtonExitWidget(),
        ],
      ),
    );
  }
}

class _ButtonExitWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(76, 61, 255, 1),
          ),
        ),
        child: const Align(
          child: Text(
            'Выйти',
            style: TextStyle(
              color: Color.fromRGBO(76, 61, 255, 1),
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactWidget extends StatelessWidget {
  const _ContactWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 126,
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
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Container(
              width: double.infinity,
              height: 48,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(244, 244, 244, 1),
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color.fromRGBO(228, 228, 228, 1),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'Поддержка',
                  style: TextStyle(
                    color: Color.fromRGBO(70, 70, 70, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 34,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(228, 228, 228, 1),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Помощь',
                    style: TextStyle(
                      color: Color.fromRGBO(70, 70, 70, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 22,
                    color: Color.fromRGBO(61, 104, 255, 1),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Связаться с нами',
                  style: TextStyle(
                    color: Color.fromRGBO(70, 70, 70, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Roboto',
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 22,
                  color: Color.fromRGBO(61, 104, 255, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BoxProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: Container(
            width: double.infinity,
            height: 108,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(228, 228, 228, 1),
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Профиль',
                    style: TextStyle(
                      color: Color.fromRGBO(70, 70, 70, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 52,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(196, 196, 196, 1),
                          ),
                          child: const Icon(
                            Icons.image_rounded,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'ФИО\n',
                                    style: TextStyle(
                                      color: Color.fromRGBO(61, 104, 255, 1),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'e-mail@mail.ru',
                                    style: TextStyle(
                                      color: Color.fromRGBO(61, 104, 255, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color.fromRGBO(61, 104, 255, 1),
                              size: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HeaderSettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, '/profile');
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Color.fromRGBO(76, 61, 255, 1),
          ),
        ),
        const Expanded(
          child: Text(
            'Настройки',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(76, 61, 255, 1),
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ],
    );
  }
}
