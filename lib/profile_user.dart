import 'package:flutter/material.dart';
import 'navigation_bar.dart';

// menu_rounded
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainNavigationBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Column(
            children: <Widget>[
              _HeaderProfileWidget(),
              const SizedBox(height: 30),
              const _AvatarAndNameWidget(),
              const SizedBox(
                height: 30,
              ),
              const _NowReadWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NowReadWidget extends StatelessWidget {
  const _NowReadWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Сейчас читаете',
          style: TextStyle(
            color: Color.fromRGBO(70, 70, 70, 1),
            fontSize: 15,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 120,
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
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 61,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: '2',
                      style: TextStyle(
                        color: Color.fromRGBO(70, 70, 70, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    TextSpan(
                      text: ' книги\n',
                      style: TextStyle(
                        color: Color.fromRGBO(70, 70, 70, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    TextSpan(
                      text: 'хочу прочитать',
                      style: TextStyle(
                        color: Color.fromRGBO(70, 70, 70, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ]),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(".dart_tool/images/open_book.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 61,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'История',
                  style: TextStyle(
                    color: Color.fromRGBO(70, 70, 70, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Roboto',
                  ),
                ),
                Icon(
                  Icons.restore_rounded,
                  size: 25,
                  color: Color.fromRGBO(128, 128, 131, 1),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AvatarAndNameWidget extends StatelessWidget {
  const _AvatarAndNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(196, 196, 196, 1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.image_rounded,
              size: 60,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Фамилия Имя Отчество',
            style: TextStyle(
              color: Color.fromRGBO(61, 104, 255, 1),
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderProfileWidget extends StatelessWidget {
  _HeaderProfileWidget({
    Key? key,
  }) : super(key: key);

  final Shader linearGradient = const LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color.fromRGBO(76, 61, 255, 1),
      Color.fromRGBO(103, 152, 230, 1),
    ],
    stops: [0, 0.86],
  ).createShader(
    const Rect.fromLTWH(65, 302, 245, 62),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, '/notific');
          },
          child: const Icon(
            Icons.notifications_none_rounded,
            size: 25,
            color: Color.fromRGBO(61, 104, 255, 1),
          ),
        ),
        Text(
          'Профиль',
          textAlign: TextAlign.center,
          style: TextStyle(
            foreground: Paint()..shader = linearGradient,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: 'Roboto',
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, '/settingsUser');
          },
          child: const Icon(
            Icons.settings,
            size: 25,
            color: Color.fromRGBO(61, 104, 255, 1),
          ),
        ),
      ],
    );
  }
}
