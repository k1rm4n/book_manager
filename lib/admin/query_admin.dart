import 'package:book_manager/data/query_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QueryAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final queryData = QueryData();

    queryData.clearAndAddAll(const _QueryBookContainerWidget());
    queryData.activeColorQueryBook();
    return ChangeNotifierProvider(
      create: (context) => queryData,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 25),
                  child: Text(
                    'Запросы',
                    style: TextStyle(
                      color: Color.fromRGBO(76, 61, 255, 1),
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    _QueryBookButtonWidget(),
                    SizedBox(
                      width: 15,
                    ),
                    _ReturnBookButtonWidget(),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                _BooksListViewWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BooksListViewWidget extends StatelessWidget {
  const _BooksListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) =>
          Provider.of<QueryData>(context).list[index],
      itemCount: Provider.of<QueryData>(context).list.length,
    );
  }
}

class _ReturnBookContainerWidget extends StatelessWidget {
  const _ReturnBookContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FittedBox(
                        child: Text(
                          'ID12341',
                          style: TextStyle(
                            color: Color.fromRGBO(196, 196, 196, 1),
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const FittedBox(
                        child: Text(
                          'Записки о Шерлоке Холмсе',
                          style: TextStyle(
                            color: Color.fromRGBO(70, 70, 70, 1),
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const FittedBox(
                        child: Text(
                          'Сэр Артур Конан Дойл, 2019',
                          style: TextStyle(
                            color: Color.fromRGBO(196, 196, 196, 1),
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FittedBox(
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Вернул: ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(196, 196, 196, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Иванов Иван',
                                    style: TextStyle(
                                      color: Color.fromRGBO(61, 104, 255, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, '/welcomQueryAdmin');
                            },
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.2),
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
                                      Color.fromARGB(255, 33, 162, 24),
                                      Color.fromARGB(255, 112, 230, 103),
                                    ],
                                  ),
                                ),
                                child: const Icon(
                                  Icons.check_rounded,
                                  color: Colors.black,
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
    );
  }
}

class _QueryBookContainerWidget extends StatelessWidget {
  const _QueryBookContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FittedBox(
                        child: Text(
                          'ID12341',
                          style: TextStyle(
                            color: Color.fromRGBO(196, 196, 196, 1),
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const FittedBox(
                        child: Text(
                          'Записки о Шерлоке Холмсе',
                          style: TextStyle(
                            color: Color.fromRGBO(70, 70, 70, 1),
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const FittedBox(
                        child: Text(
                          'Сэр Артур Конан Дойл, 2019',
                          style: TextStyle(
                            color: Color.fromRGBO(196, 196, 196, 1),
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FittedBox(
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Запросил: ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(196, 196, 196, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Иванов Иван',
                                    style: TextStyle(
                                      color: Color.fromRGBO(61, 104, 255, 1),
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/welcomQueryAdmin');
                            },
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.2),
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
                                      Color.fromRGBO(103, 152, 230, 1),
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
    );
  }
}

class _ReturnBookButtonWidget extends StatelessWidget {
  const _ReturnBookButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Provider.of<QueryData>(context, listen: false)
              .clearAndAddAll(_ReturnBookContainerWidget());

          Provider.of<QueryData>(context, listen: false).defQueryBook();
          Provider.of<QueryData>(context, listen: false)
              .activeColorReturnBook();
        },
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
          child: Align(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                'Возврат книг',
                style: TextStyle(
                  color: Provider.of<QueryData>(context).defColorReturnBook,
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
    );
  }
}

class _QueryBookButtonWidget extends StatelessWidget {
  const _QueryBookButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Provider.of<QueryData>(context, listen: false)
              .clearAndAddAll(_QueryBookContainerWidget());
          Provider.of<QueryData>(context, listen: false).defReturnBook();
          Provider.of<QueryData>(context, listen: false).activeColorQueryBook();
        },
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
          child: Align(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                'Запрос книг',
                style: TextStyle(
                  color: Provider.of<QueryData>(context).defColorQueryBook,
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
    );
  }
}
