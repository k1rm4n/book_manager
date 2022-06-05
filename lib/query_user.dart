import 'package:book_manager/data/ListData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'connect_db.dart';

class MyQuery extends StatefulWidget {
  const MyQuery({Key? key}) : super(key: key);

  @override
  State<MyQuery> createState() => _MyQueryState();
}

class _MyQueryState extends State<MyQuery> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as NameAndLogin;
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => ListData(args.id),
          child: Consumer<ListData>(
            builder: ((context, value, child) {
              return SingleChildScrollView(
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
                        GestureDetector(
                          onTap: () {
                            Provider.of<ListData>(context, listen: false)
                                .clearAndAddAll(YouRead());
                            Provider.of<ListData>(context, listen: false)
                                .activeColorYouRead();
                            Provider.of<ListData>(context, listen: false)
                                .defInWait();
                            Provider.of<ListData>(context, listen: false)
                                .defHistory();
                          },
                          child: Container(
                            height: 30,
                            constraints: const BoxConstraints(
                                maxHeight: double.infinity),
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
                              child: Text(
                                'Вы читаете',
                                style: TextStyle(
                                  color: Provider.of<ListData>(context)
                                      .defColorYouRead,
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
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<ListData>(context, listen: false)
                                .activeInWait();
                            Provider.of<ListData>(context, listen: false)
                                .defYouRead();
                            Provider.of<ListData>(context, listen: false)
                                .defHistory();
                            Provider.of<ListData>(context, listen: false)
                                .getWait();
                          },
                          child: const _WaitQuery(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<ListData>(context, listen: false)
                                .clearAndAddAll(const History());
                            Provider.of<ListData>(context, listen: false)
                                .activeHistory();
                            Provider.of<ListData>(context, listen: false)
                                .defYouRead();
                            Provider.of<ListData>(context, listen: false)
                                .defInWait();
                            Provider.of<ListData>(context, listen: false)
                                .getHistory();
                          },
                          child: Container(
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
                                children: [
                                  const Icon(
                                    Icons.restore_rounded,
                                    color: Color.fromRGBO(124, 124, 124, 1),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'История',
                                    style: TextStyle(
                                      color: Provider.of<ListData>(context)
                                          .defColorHistory,
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
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemBuilder: (context, index) =>
                          Provider.of<ListData>(context).list[index],
                      itemCount: Provider.of<ListData>(context).list.length,
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _WaitQuery extends StatelessWidget {
  const _WaitQuery({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Align(
        child: Text(
          'В ожидании',
          style: TextStyle(
            color: Provider.of<ListData>(context).defColorInWaint,
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Просмотрено',
            style: TextStyle(
              color: Color.fromRGBO(70, 70, 70, 1),
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class HistoryItemBook extends StatelessWidget {
  final String urlImage;
  final String titleBook;
  final String author;
  final String yearBook;

  const HistoryItemBook({
    Key? key,
    required this.urlImage,
    required this.titleBook,
    required this.author,
    required this.yearBook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
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
                image: DecorationImage(
                    image: NetworkImage(
                      urlImage,
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
                    Text(
                      titleBook,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
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
                    Text(
                      '$author, $yearBook',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InWait extends StatelessWidget {
  final String urlImage;
  final String titleBook;
  final String author;
  final String yearBook;
  final int idBook;
  final void Function(int index) onCancel;
  const InWait(
      {Key? key,
      required this.urlImage,
      required this.titleBook,
      required this.author,
      required this.yearBook,
      required this.onCancel,
      required this.idBook})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  image: DecorationImage(
                      image: NetworkImage(
                        urlImage,
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
                      Text(
                        titleBook,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
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
                      Text(
                        '$author, $yearBook',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
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
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Дата',
                                  style: TextStyle(
                                    color: Color.fromRGBO(124, 124, 124, 1),
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 14.04.22',
                                  style: TextStyle(
                                    color: Color.fromRGBO(70, 70, 70, 1),
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                                TextSpan(
                                  text: '\nВремя',
                                  style: TextStyle(
                                    color: Color.fromRGBO(124, 124, 124, 1),
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 12:00',
                                  style: TextStyle(
                                    color: Color.fromRGBO(70, 70, 70, 1),
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
                            width: 55,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () => onCancel(idBook),
                                  child: Container(
                                    height: 30,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: const Color.fromRGBO(
                                              228, 228, 228, 1)),
                                    ),
                                    child: const Align(
                                      child: FittedBox(
                                        child: Text(
                                          'Отмена',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                124, 124, 124, 1),
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
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class YouRead extends StatelessWidget {
  const YouRead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                                    color: Color.fromRGBO(124, 124, 124, 1),
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                ),
                                TextSpan(
                                  text: '6 д 21 ч',
                                  style: TextStyle(
                                    color: Color.fromRGBO(70, 70, 70, 1),
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
                            width: 40,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  constraints: const BoxConstraints(
                                      maxWidth: double.infinity, maxHeight: 30),
                                  height: 30,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color:
                                          const Color.fromRGBO(76, 61, 255, 1),
                                    ),
                                  ),
                                  child: const Align(
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Text(
                                        'Вернуть',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(76, 61, 255, 1),
                                            fontFamily: 'Roboto',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
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
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
