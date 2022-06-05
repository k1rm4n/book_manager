import 'package:book_manager/connect_db.dart';
import 'package:book_manager/data/profile_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// menu_rounded
class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final profileData = ProfileData();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as NameAndLogin;
    profileData.init(args);
    return ChangeNotifierProvider(
      create: (context) => profileData,
      builder: (context, widget) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                child: Column(
                  children: <Widget>[
                    _HeaderProfileWidget(
                      profileData: profileData,
                    ),
                    const SizedBox(height: 30),
                    const _AvatarAndNameWidget(),
                    const SizedBox(
                      height: 30,
                    ),
                    _NowReadWidget(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NowReadWidget extends StatelessWidget {
  const _NowReadWidget({
    Key? key,
  }) : super(key: key);

  String getTextReadBook(int countReadBook) {
    if (countReadBook == 0 || countReadBook > 4) {
      return 'Книг';
    } else if (countReadBook == 1) {
      return 'Книгу';
    } else {
      return 'Книги';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Сейчас читаете',
            style: TextStyle(
              color: Color.fromRGBO(70, 70, 70, 1),
              fontSize: 15,
            ),
            textAlign: TextAlign.left,
          ),
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
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 65,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 4),
                          blurRadius: 10,
                        ),
                      ],
                      image: const DecorationImage(
                          image: NetworkImage(
                            "https://img4.labirint.ru/rc/009ddcb31237552314703a6847875d04/220x340/books34/335480/cover.png?1612704312",
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
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
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: Provider.of<ProfileData>(context)
                          .countBookWantRead
                          .toString(),
                      style: const TextStyle(
                        color: Color.fromRGBO(70, 70, 70, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    TextSpan(
                      text:
                          ' ${getTextReadBook(Provider.of<ProfileData>(context).countBookWantRead)}\n',
                      style: const TextStyle(
                        color: Color.fromRGBO(70, 70, 70, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const TextSpan(
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
                      image: AssetImage("images/open_book.png"),
                    ),
                  ),
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
              Icons.person,
              size: 60,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            Provider.of<ProfileData>(context).name,
            style: const TextStyle(
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
    required this.profileData,
  }) : super(key: key);

  final ProfileData profileData;
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
            Navigator.pushNamed(context, '/notific');
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
            Navigator.pushNamed(context, '/settingsUser',
                arguments: NameAndLogin(
                    profileData.name, profileData.login, profileData.id));
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
